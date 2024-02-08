#! /usr/bin/python
# -*- coding:utf-8 -*-
from flask import Blueprint
from flask import request, render_template, redirect, abort, flash, session

from connexion_db import get_db

client_panier = Blueprint('client_panier', __name__,
                        template_folder='templates')


@client_panier.route('/client/panier/add', methods=['POST'])
def client_panier_add():
    mycursor = get_db().cursor()
    id_client = session['id_user']
    id_article = request.form.get('id_article')
    quantite = request.form.get('quantite')
    # ---------
    id_declinaison_article=request.form.get('id_declinaison',None)
    id_declinaison_article = 1

# ajout dans le panier d'une déclinaison d'un article (si 1 declinaison : immédiat sinon => vu pour faire un choix
    sql = ''' SELECT * FROM declinaison 
    LEFT JOIN couleur ON couleur.id_couleur = declinaison.couleur_declinaison 
    LEFT JOIN taille ON taille.id_taille = declinaison.taille_declinaison WHERE id_equipement = %s '''
    print("id_article",id_article)
    mycursor.execute(sql, id_article)
    declinaisons = mycursor.fetchall()

    if len(declinaisons) == 1:
        id_declinaison_article = declinaisons[0]['id_declinaison']
    elif len(declinaisons) == 0:
        abort("pb nb de declinaison")
    else:
        sql = ''' SELECT * FROM equipement WHERE id_equipement = %s '''
        mycursor.execute(sql, (id_article))
        article = mycursor.fetchone()
        return render_template('client/boutique/declinaison_article.html'
                                   , declinaisons=declinaisons
                                   , quantite=quantite
                                   , article=article)

# ajout dans le panier d'un article


    return redirect('/client/article/show')

@client_panier.route('/client/panier/delete', methods=['POST'])
def client_panier_delete():
    mycursor = get_db().cursor()
    id_client = session['id_user']
    id_article = request.form.get('id_article','')
    quantite = 1

    # ---------
    # partie 2 : on supprime une déclinaison de l'article
    # id_declinaison_article = request.form.get('id_declinaison_article', None)
    article_panier=[]
    sql = ''' SELECT libelle_equipement, prix_equipement FROM equipement WHERE id_equipement = %s '''
    mycursor.execute(sql, id_article)
    article_panier = mycursor.fetchone()

    if not(article_panier is None) and article_panier['quantite'] > 1:
        # mise à jour de la quantité dans le panier => -1 article
        sql = ''' UPDATE ligne_panier SET quantite = quantite - 1 WHERE id_article = %s AND id_client = %s '''
    else:
        # suppression de la ligne de panier
        sql = ''' DELETE FROM ligne_panier WHERE id_article = %s AND id_client = %s'''

    # mise à jour du stock de l'article disponible
    get_db().commit()
    return redirect('/client/article/show')





@client_panier.route('/client/panier/vider', methods=['POST'])
def client_panier_vider():
    mycursor = get_db().cursor()
    client_id = session['id_user']
    # sélection des lignes de panier
    sql = ''' SELECT * FROM ligne_panier WHERE id_client = %s '''
    items_panier = []
    for item in items_panier:
        # suppression de la ligne de panier de l'article pour l'utilisateur connecté
        sql = ''' DELETE FROM ligne_panier WHERE id_article = %s AND id_client = %s '''
        # mise à jour du stock de l'article : stock = stock + qté de la ligne pour l'article
        sql2=''' UPDATE equipement SET stock = stock + %s WHERE id_equipement = %s '''
        get_db().commit()
    return redirect('/client/article/show')


@client_panier.route('/client/panier/delete/line', methods=['POST'])
def client_panier_delete_line():
    mycursor = get_db().cursor()
    id_client = session['id_user']
    #id_declinaison_article = request.form.get('id_declinaison_article')

    sql = ''' selection de ligne du panier '''

    sql = ''' suppression de la ligne du panier '''
    sql2=''' mise à jour du stock de l'article : stock = stock + qté de la ligne pour l'article'''

    get_db().commit()
    return redirect('/client/article/show')


@client_panier.route('/client/panier/filtre', methods=['POST'])
def client_panier_filtre():
    filter_word = request.form.get('filter_word', None)
    filter_prix_min = request.form.get('filter_prix_min', None)
    filter_prix_max = request.form.get('filter_prix_max', None)
    filter_types = request.form.getlist('filter_types', None)
    # test des variables puis
    # mise en session des variables
    return redirect('/client/article/show')


@client_panier.route('/client/panier/filtre/suppr', methods=['POST'])
def client_panier_filtre_suppr():
    # suppression  des variables en session
    print("suppr filtre")
    return redirect('/client/article/show')

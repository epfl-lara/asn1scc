; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4130 () Bool)

(assert start!4130)

(declare-fun mapIsEmpty!277 () Bool)

(declare-fun mapRes!278 () Bool)

(assert (=> mapIsEmpty!277 mapRes!278))

(declare-fun mapIsEmpty!278 () Bool)

(declare-fun mapRes!277 () Bool)

(assert (=> mapIsEmpty!278 mapRes!277))

(declare-fun mapNonEmpty!277 () Bool)

(declare-fun tp!277 () Bool)

(declare-fun tp_is_empty!93 () Bool)

(assert (=> mapNonEmpty!277 (= mapRes!277 (and tp!277 tp_is_empty!93))))

(declare-datatypes ((T!4399 0))(
  ( (T!4400 (val!46 Int)) )
))
(declare-datatypes ((array!1116 0))(
  ( (array!1117 (arr!905 (Array (_ BitVec 32) T!4399)) (size!476 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1116)

(declare-fun mapRest!277 () (Array (_ BitVec 32) T!4399))

(declare-fun mapKey!277 () (_ BitVec 32))

(declare-fun mapValue!277 () T!4399)

(assert (=> mapNonEmpty!277 (= (arr!905 dst!10) (store mapRest!277 mapKey!277 mapValue!277))))

(declare-fun mapNonEmpty!278 () Bool)

(declare-fun tp!278 () Bool)

(assert (=> mapNonEmpty!278 (= mapRes!278 (and tp!278 tp_is_empty!93))))

(declare-fun mapKey!278 () (_ BitVec 32))

(declare-fun mapValue!278 () T!4399)

(declare-fun mapRest!278 () (Array (_ BitVec 32) T!4399))

(declare-fun src!2 () array!1116)

(assert (=> mapNonEmpty!278 (= (arr!905 src!2) (store mapRest!278 mapKey!278 mapValue!278))))

(declare-fun b!17411 () Bool)

(declare-fun e!11124 () Bool)

(assert (=> b!17411 (= e!11124 (and tp_is_empty!93 mapRes!277))))

(declare-fun condMapEmpty!278 () Bool)

(declare-fun mapDefault!278 () T!4399)

(assert (=> b!17411 (= condMapEmpty!278 (= (arr!905 dst!10) ((as const (Array (_ BitVec 32) T!4399)) mapDefault!278)))))

(declare-fun b!17412 () Bool)

(declare-fun e!11123 () Bool)

(assert (=> b!17412 (= e!11123 (and tp_is_empty!93 mapRes!278))))

(declare-fun condMapEmpty!277 () Bool)

(declare-fun mapDefault!277 () T!4399)

(assert (=> b!17412 (= condMapEmpty!277 (= (arr!905 src!2) ((as const (Array (_ BitVec 32) T!4399)) mapDefault!277)))))

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4130 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!476 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!476 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (bvsge (bvsub toSrc!1 (bvadd #b00000000000000000000000000000001 fromSrc!2)) (bvsub toSrc!1 fromSrc!2)))))

(declare-fun array_inv!447 (array!1116) Bool)

(assert (=> start!4130 (and (array_inv!447 dst!10) e!11124)))

(assert (=> start!4130 true))

(assert (=> start!4130 (and (array_inv!447 src!2) e!11123)))

(assert (= (and b!17411 condMapEmpty!278) mapIsEmpty!278))

(assert (= (and b!17411 (not condMapEmpty!278)) mapNonEmpty!277))

(assert (= start!4130 b!17411))

(assert (= (and b!17412 condMapEmpty!277) mapIsEmpty!277))

(assert (= (and b!17412 (not condMapEmpty!277)) mapNonEmpty!278))

(assert (= start!4130 b!17412))

(declare-fun m!23687 () Bool)

(assert (=> mapNonEmpty!277 m!23687))

(declare-fun m!23689 () Bool)

(assert (=> mapNonEmpty!278 m!23689))

(declare-fun m!23691 () Bool)

(assert (=> start!4130 m!23691))

(declare-fun m!23693 () Bool)

(assert (=> start!4130 m!23693))

(check-sat (not start!4130) (not mapNonEmpty!277) (not mapNonEmpty!278) tp_is_empty!93)
(check-sat)

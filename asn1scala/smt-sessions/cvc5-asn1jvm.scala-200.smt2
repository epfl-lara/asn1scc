; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4086 () Bool)

(assert start!4086)

(declare-datatypes ((T!4241 0))(
  ( (T!4242 (val!27 Int)) )
))
(declare-datatypes ((array!1075 0))(
  ( (array!1076 (arr!886 (Array (_ BitVec 32) T!4241)) (size!457 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1075)

(declare-fun src!2 () array!1075)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(declare-fun toSrc!1 () (_ BitVec 32))

(assert (=> start!4086 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!457 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (not (= (bvand (size!457 dst!10) #b10000000000000000000000000000000) (bvand (bvsub toSrc!1 fromSrc!2) #b10000000000000000000000000000000))) (not (= (bvand (size!457 dst!10) #b10000000000000000000000000000000) (bvand (bvsub (size!457 dst!10) (bvsub toSrc!1 fromSrc!2)) #b10000000000000000000000000000000))))))

(declare-fun e!11010 () Bool)

(declare-fun array_inv!437 (array!1075) Bool)

(assert (=> start!4086 (and (array_inv!437 dst!10) e!11010)))

(assert (=> start!4086 true))

(declare-fun e!11009 () Bool)

(assert (=> start!4086 (and (array_inv!437 src!2) e!11009)))

(declare-fun mapNonEmpty!151 () Bool)

(declare-fun mapRes!152 () Bool)

(declare-fun tp!151 () Bool)

(declare-fun tp_is_empty!55 () Bool)

(assert (=> mapNonEmpty!151 (= mapRes!152 (and tp!151 tp_is_empty!55))))

(declare-fun mapRest!151 () (Array (_ BitVec 32) T!4241))

(declare-fun mapValue!152 () T!4241)

(declare-fun mapKey!151 () (_ BitVec 32))

(assert (=> mapNonEmpty!151 (= (arr!886 src!2) (store mapRest!151 mapKey!151 mapValue!152))))

(declare-fun b!17291 () Bool)

(declare-fun mapRes!151 () Bool)

(assert (=> b!17291 (= e!11010 (and tp_is_empty!55 mapRes!151))))

(declare-fun condMapEmpty!151 () Bool)

(declare-fun mapDefault!151 () T!4241)


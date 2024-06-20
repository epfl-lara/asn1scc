; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4120 () Bool)

(assert start!4120)

(declare-datatypes ((T!4371 0))(
  ( (T!4372 (val!42 Int)) )
))
(declare-datatypes ((array!1107 0))(
  ( (array!1108 (arr!901 (Array (_ BitVec 32) T!4371)) (size!472 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1107)

(declare-fun src!2 () array!1107)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(declare-fun toSrc!1 () (_ BitVec 32))

(assert (=> start!4120 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!472 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!472 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1) (= (bvand fromDst!2 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand fromDst!2 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 fromDst!2) #b10000000000000000000000000000000))))))

(declare-fun e!11100 () Bool)

(declare-fun array_inv!444 (array!1107) Bool)

(assert (=> start!4120 (and (array_inv!444 dst!10) e!11100)))

(assert (=> start!4120 true))

(declare-fun e!11099 () Bool)

(assert (=> start!4120 (and (array_inv!444 src!2) e!11099)))

(declare-fun b!17385 () Bool)

(declare-fun tp_is_empty!85 () Bool)

(declare-fun mapRes!249 () Bool)

(assert (=> b!17385 (= e!11100 (and tp_is_empty!85 mapRes!249))))

(declare-fun condMapEmpty!249 () Bool)

(declare-fun mapDefault!250 () T!4371)


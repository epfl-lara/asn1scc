; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4044 () Bool)

(assert start!4044)

(declare-datatypes ((T!4085 0))(
  ( (T!4086 (val!9 Int)) )
))
(declare-datatypes ((array!1037 0))(
  ( (array!1038 (arr!868 (Array (_ BitVec 32) T!4085)) (size!439 (_ BitVec 32))) )
))
(declare-fun dst!20 () array!1037)

(declare-fun len!1 () (_ BitVec 32))

(declare-fun fromDst!6 () (_ BitVec 32))

(declare-fun fromSrc!6 () (_ BitVec 32))

(declare-fun src!6 () array!1037)

(assert (=> start!4044 (and (bvsle #b00000000000000000000000000000000 len!1) (bvsle len!1 (size!439 src!6)) (bvsle len!1 (size!439 dst!20)) (bvsle #b00000000000000000000000000000000 fromSrc!6) (bvsle fromSrc!6 (bvsub (size!439 src!6) len!1)) (bvsle #b00000000000000000000000000000000 fromDst!6) (not (= (bvand (size!439 dst!20) #b10000000000000000000000000000000) (bvand len!1 #b10000000000000000000000000000000))) (not (= (bvand (size!439 dst!20) #b10000000000000000000000000000000) (bvand (bvsub (size!439 dst!20) len!1) #b10000000000000000000000000000000))))))

(declare-fun e!10898 () Bool)

(declare-fun array_inv!426 (array!1037) Bool)

(assert (=> start!4044 (and (array_inv!426 dst!20) e!10898)))

(assert (=> start!4044 true))

(declare-fun e!10899 () Bool)

(assert (=> start!4044 (and (array_inv!426 src!6) e!10899)))

(declare-fun b!17173 () Bool)

(declare-fun tp_is_empty!19 () Bool)

(declare-fun mapRes!44 () Bool)

(assert (=> b!17173 (= e!10898 (and tp_is_empty!19 mapRes!44))))

(declare-fun condMapEmpty!44 () Bool)

(declare-fun mapDefault!44 () T!4085)


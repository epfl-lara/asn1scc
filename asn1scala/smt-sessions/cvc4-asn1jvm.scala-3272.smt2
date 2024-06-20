; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74122 () Bool)

(assert start!74122)

(declare-fun b!327021 () Bool)

(declare-fun e!236235 () Bool)

(assert (=> b!327021 (= e!236235 false)))

(declare-datatypes ((Unit!22166 0))(
  ( (Unit!22167) )
))
(declare-fun lt!448691 () Unit!22166)

(declare-datatypes ((T!66753 0))(
  ( (T!66754 (val!563 Int)) )
))
(declare-datatypes ((array!21350 0))(
  ( (array!21351 (arr!10359 (Array (_ BitVec 32) T!66753)) (size!9267 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21350)

(declare-fun i!907 () (_ BitVec 32))

(declare-fun rec!129 (array!21350 (_ BitVec 32)) Unit!22166)

(assert (=> b!327021 (= lt!448691 (rec!129 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(declare-fun b!327022 () Bool)

(declare-fun e!236236 () Bool)

(declare-fun tp_is_empty!1127 () Bool)

(declare-fun mapRes!3418 () Bool)

(assert (=> b!327022 (= e!236236 (and tp_is_empty!1127 mapRes!3418))))

(declare-fun condMapEmpty!3418 () Bool)

(declare-fun mapDefault!3418 () T!66753)


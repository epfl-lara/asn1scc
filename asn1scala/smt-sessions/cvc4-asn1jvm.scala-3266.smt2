; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74076 () Bool)

(assert start!74076)

(declare-datatypes ((Unit!22151 0))(
  ( (Unit!22152) )
))
(declare-fun lt!448661 () Unit!22151)

(declare-datatypes ((T!66597 0))(
  ( (T!66598 (val!545 Int)) )
))
(declare-datatypes ((array!21312 0))(
  ( (array!21313 (arr!10341 (Array (_ BitVec 32) T!66597)) (size!9249 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21312)

(declare-fun rec!122 (array!21312 (_ BitVec 32)) Unit!22151)

(assert (=> start!74076 (= lt!448661 (rec!122 a!404 (size!9249 a!404)))))

(declare-fun arrayRangesEq!1861 (array!21312 array!21312 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!74076 (not (arrayRangesEq!1861 a!404 a!404 #b00000000000000000000000000000000 (size!9249 a!404)))))

(declare-fun e!236111 () Bool)

(declare-fun array_inv!8800 (array!21312) Bool)

(assert (=> start!74076 (and (array_inv!8800 a!404) e!236111)))

(declare-fun b!326802 () Bool)

(declare-fun tp_is_empty!1091 () Bool)

(declare-fun mapRes!3358 () Bool)

(assert (=> b!326802 (= e!236111 (and tp_is_empty!1091 mapRes!3358))))

(declare-fun condMapEmpty!3358 () Bool)

(declare-fun mapDefault!3358 () T!66597)


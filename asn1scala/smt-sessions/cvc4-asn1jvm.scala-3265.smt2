; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74070 () Bool)

(assert start!74070)

(declare-datatypes ((Unit!22145 0))(
  ( (Unit!22146) )
))
(declare-fun lt!448652 () Unit!22145)

(declare-datatypes ((T!66571 0))(
  ( (T!66572 (val!542 Int)) )
))
(declare-datatypes ((array!21306 0))(
  ( (array!21307 (arr!10338 (Array (_ BitVec 32) T!66571)) (size!9246 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21306)

(declare-fun rec!119 (array!21306 (_ BitVec 32)) Unit!22145)

(assert (=> start!74070 (= lt!448652 (rec!119 a!404 (size!9246 a!404)))))

(assert (=> start!74070 false))

(declare-fun e!236102 () Bool)

(declare-fun array_inv!8797 (array!21306) Bool)

(assert (=> start!74070 (and (array_inv!8797 a!404) e!236102)))

(declare-fun b!326793 () Bool)

(declare-fun tp_is_empty!1085 () Bool)

(declare-fun mapRes!3349 () Bool)

(assert (=> b!326793 (= e!236102 (and tp_is_empty!1085 mapRes!3349))))

(declare-fun condMapEmpty!3349 () Bool)

(declare-fun mapDefault!3349 () T!66571)


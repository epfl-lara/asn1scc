; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74066 () Bool)

(assert start!74066)

(declare-datatypes ((Unit!22141 0))(
  ( (Unit!22142) )
))
(declare-fun lt!448646 () Unit!22141)

(declare-datatypes ((T!66567 0))(
  ( (T!66568 (val!540 Int)) )
))
(declare-datatypes ((array!21302 0))(
  ( (array!21303 (arr!10336 (Array (_ BitVec 32) T!66567)) (size!9244 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21302)

(declare-fun rec!117 (array!21302 (_ BitVec 32)) Unit!22141)

(assert (=> start!74066 (= lt!448646 (rec!117 a!404 (size!9244 a!404)))))

(assert (=> start!74066 false))

(declare-fun e!236096 () Bool)

(declare-fun array_inv!8795 (array!21302) Bool)

(assert (=> start!74066 (and (array_inv!8795 a!404) e!236096)))

(declare-fun b!326787 () Bool)

(declare-fun tp_is_empty!1081 () Bool)

(declare-fun mapRes!3343 () Bool)

(assert (=> b!326787 (= e!236096 (and tp_is_empty!1081 mapRes!3343))))

(declare-fun condMapEmpty!3343 () Bool)

(declare-fun mapDefault!3343 () T!66567)


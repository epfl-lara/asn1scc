; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74054 () Bool)

(assert start!74054)

(declare-datatypes ((Unit!22132 0))(
  ( (Unit!22133) )
))
(declare-fun lt!448631 () Unit!22132)

(declare-datatypes ((T!66519 0))(
  ( (T!66520 (val!536 Int)) )
))
(declare-datatypes ((array!21293 0))(
  ( (array!21294 (arr!10332 (Array (_ BitVec 32) T!66519)) (size!9240 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21293)

(declare-fun rec!113 (array!21293 (_ BitVec 32)) Unit!22132)

(assert (=> start!74054 (= lt!448631 (rec!113 a!404 (size!9240 a!404)))))

(assert (=> start!74054 (bvsgt #b00000000000000000000000000000000 (size!9240 a!404))))

(declare-fun e!236081 () Bool)

(declare-fun array_inv!8791 (array!21293) Bool)

(assert (=> start!74054 (and (array_inv!8791 a!404) e!236081)))

(declare-fun b!326767 () Bool)

(declare-fun tp_is_empty!1073 () Bool)

(declare-fun mapRes!3328 () Bool)

(assert (=> b!326767 (= e!236081 (and tp_is_empty!1073 mapRes!3328))))

(declare-fun condMapEmpty!3328 () Bool)

(declare-fun mapDefault!3328 () T!66519)


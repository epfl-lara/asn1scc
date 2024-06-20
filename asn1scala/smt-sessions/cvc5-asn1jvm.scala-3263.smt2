; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74050 () Bool)

(assert start!74050)

(declare-datatypes ((Unit!22128 0))(
  ( (Unit!22129) )
))
(declare-fun lt!448625 () Unit!22128)

(declare-datatypes ((T!66515 0))(
  ( (T!66516 (val!534 Int)) )
))
(declare-datatypes ((array!21289 0))(
  ( (array!21290 (arr!10330 (Array (_ BitVec 32) T!66515)) (size!9238 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21289)

(declare-fun rec!111 (array!21289 (_ BitVec 32)) Unit!22128)

(assert (=> start!74050 (= lt!448625 (rec!111 a!404 (size!9238 a!404)))))

(assert (=> start!74050 (bvsgt #b00000000000000000000000000000000 (size!9238 a!404))))

(declare-fun e!236075 () Bool)

(declare-fun array_inv!8789 (array!21289) Bool)

(assert (=> start!74050 (and (array_inv!8789 a!404) e!236075)))

(declare-fun b!326761 () Bool)

(declare-fun tp_is_empty!1069 () Bool)

(declare-fun mapRes!3322 () Bool)

(assert (=> b!326761 (= e!236075 (and tp_is_empty!1069 mapRes!3322))))

(declare-fun condMapEmpty!3322 () Bool)

(declare-fun mapDefault!3322 () T!66515)


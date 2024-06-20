; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74060 () Bool)

(assert start!74060)

(declare-datatypes ((Unit!22135 0))(
  ( (Unit!22136) )
))
(declare-fun lt!448637 () Unit!22135)

(declare-datatypes ((T!66541 0))(
  ( (T!66542 (val!537 Int)) )
))
(declare-datatypes ((array!21296 0))(
  ( (array!21297 (arr!10333 (Array (_ BitVec 32) T!66541)) (size!9241 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21296)

(declare-fun rec!114 (array!21296 (_ BitVec 32)) Unit!22135)

(assert (=> start!74060 (= lt!448637 (rec!114 a!404 (size!9241 a!404)))))

(assert (=> start!74060 false))

(declare-fun e!236087 () Bool)

(declare-fun array_inv!8792 (array!21296) Bool)

(assert (=> start!74060 (and (array_inv!8792 a!404) e!236087)))

(declare-fun b!326778 () Bool)

(declare-fun tp_is_empty!1075 () Bool)

(declare-fun mapRes!3334 () Bool)

(assert (=> b!326778 (= e!236087 (and tp_is_empty!1075 mapRes!3334))))

(declare-fun condMapEmpty!3334 () Bool)

(declare-fun mapDefault!3334 () T!66541)


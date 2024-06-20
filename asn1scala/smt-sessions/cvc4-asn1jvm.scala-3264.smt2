; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74064 () Bool)

(assert start!74064)

(declare-datatypes ((Unit!22139 0))(
  ( (Unit!22140) )
))
(declare-fun lt!448643 () Unit!22139)

(declare-datatypes ((T!66545 0))(
  ( (T!66546 (val!539 Int)) )
))
(declare-datatypes ((array!21300 0))(
  ( (array!21301 (arr!10335 (Array (_ BitVec 32) T!66545)) (size!9243 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21300)

(declare-fun rec!116 (array!21300 (_ BitVec 32)) Unit!22139)

(assert (=> start!74064 (= lt!448643 (rec!116 a!404 (size!9243 a!404)))))

(assert (=> start!74064 false))

(declare-fun e!236093 () Bool)

(declare-fun array_inv!8794 (array!21300) Bool)

(assert (=> start!74064 (and (array_inv!8794 a!404) e!236093)))

(declare-fun b!326784 () Bool)

(declare-fun tp_is_empty!1079 () Bool)

(declare-fun mapRes!3340 () Bool)

(assert (=> b!326784 (= e!236093 (and tp_is_empty!1079 mapRes!3340))))

(declare-fun condMapEmpty!3340 () Bool)

(declare-fun mapDefault!3340 () T!66545)


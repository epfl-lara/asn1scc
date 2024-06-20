; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74036 () Bool)

(assert start!74036)

(declare-datatypes ((T!66467 0))(
  ( (T!66468 (val!530 Int)) )
))
(declare-datatypes ((array!21279 0))(
  ( (array!21280 (arr!10326 (Array (_ BitVec 32) T!66467)) (size!9234 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21279)

(assert (=> start!74036 (bvsgt #b00000000000000000000000000000000 (size!9234 a!404))))

(declare-fun e!236048 () Bool)

(declare-fun array_inv!8786 (array!21279) Bool)

(assert (=> start!74036 (and (array_inv!8786 a!404) e!236048)))

(declare-fun b!326730 () Bool)

(declare-fun tp_is_empty!1061 () Bool)

(declare-fun mapRes!3304 () Bool)

(assert (=> b!326730 (= e!236048 (and tp_is_empty!1061 mapRes!3304))))

(declare-fun condMapEmpty!3304 () Bool)

(declare-fun mapDefault!3304 () T!66467)


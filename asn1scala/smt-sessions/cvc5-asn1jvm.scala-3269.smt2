; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74096 () Bool)

(assert start!74096)

(declare-fun b!326879 () Bool)

(declare-fun e!236161 () Bool)

(declare-fun tp_is_empty!1105 () Bool)

(declare-fun mapRes!3382 () Bool)

(assert (=> b!326879 (= e!236161 (and tp_is_empty!1105 mapRes!3382))))

(declare-fun condMapEmpty!3382 () Bool)

(declare-datatypes ((T!66671 0))(
  ( (T!66672 (val!552 Int)) )
))
(declare-datatypes ((array!21327 0))(
  ( (array!21328 (arr!10348 (Array (_ BitVec 32) T!66671)) (size!9256 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21327)

(declare-fun mapDefault!3382 () T!66671)


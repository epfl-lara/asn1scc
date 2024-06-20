; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64252 () Bool)

(assert start!64252)

(declare-fun b!287986 () Bool)

(declare-fun e!204908 () Bool)

(declare-fun tp_is_empty!673 () Bool)

(declare-fun mapRes!2176 () Bool)

(assert (=> b!287986 (= e!204908 (and tp_is_empty!673 mapRes!2176))))

(declare-fun condMapEmpty!2175 () Bool)

(declare-datatypes ((T!52399 0))(
  ( (T!52400 (val!336 Int)) )
))
(declare-datatypes ((array!16955 0))(
  ( (array!16956 (arr!8323 (Array (_ BitVec 32) T!52399)) (size!7327 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16955)

(declare-fun mapDefault!2176 () T!52399)


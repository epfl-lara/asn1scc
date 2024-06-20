; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74044 () Bool)

(assert start!74044)

(declare-fun b!326750 () Bool)

(declare-fun e!236066 () Bool)

(declare-fun tp_is_empty!1067 () Bool)

(declare-fun mapRes!3316 () Bool)

(assert (=> b!326750 (= e!236066 (and tp_is_empty!1067 mapRes!3316))))

(declare-fun condMapEmpty!3316 () Bool)

(declare-datatypes ((T!66493 0))(
  ( (T!66494 (val!533 Int)) )
))
(declare-datatypes ((array!21286 0))(
  ( (array!21287 (arr!10329 (Array (_ BitVec 32) T!66493)) (size!9237 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21286)

(declare-fun mapDefault!3316 () T!66493)


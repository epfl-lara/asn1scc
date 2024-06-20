; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63236 () Bool)

(assert start!63236)

(declare-fun b!283443 () Bool)

(declare-fun e!202345 () Bool)

(declare-fun tp_is_empty!389 () Bool)

(declare-fun mapRes!1014 () Bool)

(assert (=> b!283443 (= e!202345 (and tp_is_empty!389 mapRes!1014))))

(declare-fun condMapEmpty!1014 () Bool)

(declare-datatypes ((T!50495 0))(
  ( (T!50496 (val!194 Int)) )
))
(declare-datatypes ((array!16424 0))(
  ( (array!16425 (arr!8091 (Array (_ BitVec 32) T!50495)) (size!7095 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16424)

(declare-fun mapDefault!1015 () T!50495)


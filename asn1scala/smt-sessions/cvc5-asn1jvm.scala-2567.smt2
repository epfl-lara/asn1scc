; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64188 () Bool)

(assert start!64188)

(declare-fun mapIsEmpty!1989 () Bool)

(declare-fun mapRes!1989 () Bool)

(assert (=> mapIsEmpty!1989 mapRes!1989))

(declare-fun b!287395 () Bool)

(declare-fun e!204605 () Bool)

(declare-fun tp_is_empty!613 () Bool)

(declare-fun mapRes!1990 () Bool)

(assert (=> b!287395 (= e!204605 (and tp_is_empty!613 mapRes!1990))))

(declare-fun condMapEmpty!1990 () Bool)

(declare-datatypes ((T!52139 0))(
  ( (T!52140 (val!306 Int)) )
))
(declare-datatypes ((array!16894 0))(
  ( (array!16895 (arr!8293 (Array (_ BitVec 32) T!52139)) (size!7297 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16894)

(declare-fun mapDefault!1989 () T!52139)


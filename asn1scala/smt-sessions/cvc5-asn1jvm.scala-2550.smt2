; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64070 () Bool)

(assert start!64070)

(declare-fun b!285894 () Bool)

(declare-fun res!236594 () Bool)

(declare-fun e!203955 () Bool)

(assert (=> b!285894 (=> (not res!236594) (not e!203955))))

(declare-datatypes ((T!51697 0))(
  ( (T!51698 (val!255 Int)) )
))
(declare-datatypes ((array!16789 0))(
  ( (array!16790 (arr!8242 (Array (_ BitVec 32) T!51697)) (size!7246 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16789)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16789)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1388 (array!16789 array!16789 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285894 (= res!236594 (arrayRangesEq!1388 a2!647 a3!68 from!773 to!740))))

(declare-fun b!285895 () Bool)

(declare-fun res!236593 () Bool)

(assert (=> b!285895 (=> (not res!236593) (not e!203955))))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun a1!647 () array!16789)

(assert (=> b!285895 (= res!236593 (arrayRangesEq!1388 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285896 () Bool)

(declare-fun e!203954 () Bool)

(declare-fun tp_is_empty!511 () Bool)

(declare-fun mapRes!1562 () Bool)

(assert (=> b!285896 (= e!203954 (and tp_is_empty!511 mapRes!1562))))

(declare-fun condMapEmpty!1562 () Bool)

(declare-fun mapDefault!1562 () T!51697)


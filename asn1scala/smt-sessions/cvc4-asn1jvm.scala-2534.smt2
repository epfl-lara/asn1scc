; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63974 () Bool)

(assert start!63974)

(declare-fun mapNonEmpty!1143 () Bool)

(declare-fun mapRes!1145 () Bool)

(declare-fun tp!1144 () Bool)

(declare-fun tp_is_empty!419 () Bool)

(assert (=> mapNonEmpty!1143 (= mapRes!1145 (and tp!1144 tp_is_empty!419))))

(declare-datatypes ((T!51285 0))(
  ( (T!51286 (val!209 Int)) )
))
(declare-datatypes ((array!16696 0))(
  ( (array!16697 (arr!8196 (Array (_ BitVec 32) T!51285)) (size!7200 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16696)

(declare-fun mapKey!1143 () (_ BitVec 32))

(declare-fun mapValue!1144 () T!51285)

(declare-fun mapRest!1145 () (Array (_ BitVec 32) T!51285))

(assert (=> mapNonEmpty!1143 (= (arr!8196 a2!623) (store mapRest!1145 mapKey!1143 mapValue!1144))))

(declare-fun mapIsEmpty!1143 () Bool)

(declare-fun mapRes!1144 () Bool)

(assert (=> mapIsEmpty!1143 mapRes!1144))

(declare-fun b!284496 () Bool)

(declare-fun res!235613 () Bool)

(declare-fun e!203365 () Bool)

(assert (=> b!284496 (=> (not res!235613) (not e!203365))))

(declare-fun a3!63 () array!16696)

(declare-fun from!749 () (_ BitVec 32))

(declare-fun to!716 () (_ BitVec 32))

(declare-fun arrayRangesEq!1351 (array!16696 array!16696 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284496 (= res!235613 (arrayRangesEq!1351 a2!623 a3!63 from!749 to!716))))

(declare-fun b!284497 () Bool)

(declare-fun res!235611 () Bool)

(assert (=> b!284497 (=> (not res!235611) (not e!203365))))

(declare-fun a1!623 () array!16696)

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> b!284497 (= res!235611 (arrayRangesEq!1351 a1!623 a2!623 from!749 mid!66))))

(declare-fun mapIsEmpty!1144 () Bool)

(assert (=> mapIsEmpty!1144 mapRes!1145))

(declare-fun b!284498 () Bool)

(declare-fun e!203367 () Bool)

(declare-fun mapRes!1143 () Bool)

(assert (=> b!284498 (= e!203367 (and tp_is_empty!419 mapRes!1143))))

(declare-fun condMapEmpty!1144 () Bool)

(declare-fun mapDefault!1145 () T!51285)


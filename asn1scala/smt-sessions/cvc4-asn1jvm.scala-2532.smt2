; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63962 () Bool)

(assert start!63962)

(declare-fun res!235538 () Bool)

(declare-fun e!203295 () Bool)

(assert (=> start!63962 (=> (not res!235538) (not e!203295))))

(declare-datatypes ((T!51233 0))(
  ( (T!51234 (val!203 Int)) )
))
(declare-datatypes ((array!16684 0))(
  ( (array!16685 (arr!8190 (Array (_ BitVec 32) T!51233)) (size!7194 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16684)

(declare-fun a1!623 () array!16684)

(declare-fun to!716 () (_ BitVec 32))

(declare-fun from!749 () (_ BitVec 32))

(declare-fun mid!66 () (_ BitVec 32))

(declare-fun a3!63 () array!16684)

(assert (=> start!63962 (= res!235538 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7194 a1!623) (size!7194 a2!623)) (bvsle (size!7194 a2!623) (size!7194 a3!63)) (bvsle mid!66 (size!7194 a1!623)) (bvsle to!716 (size!7194 a2!623))))))

(assert (=> start!63962 e!203295))

(declare-fun e!203294 () Bool)

(declare-fun array_inv!6884 (array!16684) Bool)

(assert (=> start!63962 (and (array_inv!6884 a2!623) e!203294)))

(declare-fun e!203292 () Bool)

(assert (=> start!63962 (and (array_inv!6884 a1!623) e!203292)))

(assert (=> start!63962 true))

(declare-fun e!203293 () Bool)

(assert (=> start!63962 (and (array_inv!6884 a3!63) e!203293)))

(declare-fun b!284370 () Bool)

(declare-fun res!235541 () Bool)

(assert (=> b!284370 (=> (not res!235541) (not e!203295))))

(declare-fun arrayRangesEq!1347 (array!16684 array!16684 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284370 (= res!235541 (arrayRangesEq!1347 a1!623 a2!623 from!749 mid!66))))

(declare-fun b!284371 () Bool)

(declare-fun tp_is_empty!407 () Bool)

(declare-fun mapRes!1089 () Bool)

(assert (=> b!284371 (= e!203293 (and tp_is_empty!407 mapRes!1089))))

(declare-fun condMapEmpty!1091 () Bool)

(declare-fun mapDefault!1089 () T!51233)


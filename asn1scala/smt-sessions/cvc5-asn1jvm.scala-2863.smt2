; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68704 () Bool)

(assert start!68704)

(declare-fun mapNonEmpty!3091 () Bool)

(declare-fun mapRes!3091 () Bool)

(declare-fun tp!3091 () Bool)

(declare-fun tp_is_empty!973 () Bool)

(assert (=> mapNonEmpty!3091 (= mapRes!3091 (and tp!3091 tp_is_empty!973))))

(declare-datatypes ((T!58419 0))(
  ( (T!58420 (val!486 Int)) )
))
(declare-fun mapValue!3092 () T!58419)

(declare-fun mapRest!3091 () (Array (_ BitVec 32) T!58419))

(declare-fun mapKey!3092 () (_ BitVec 32))

(declare-datatypes ((array!18839 0))(
  ( (array!18840 (arr!9256 (Array (_ BitVec 32) T!58419)) (size!8173 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18839)

(assert (=> mapNonEmpty!3091 (= (arr!9256 a2!566) (store mapRest!3091 mapKey!3092 mapValue!3092))))

(declare-fun res!254243 () Bool)

(declare-fun e!222855 () Bool)

(assert (=> start!68704 (=> (not res!254243) (not e!222855))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun a1!566 () array!18839)

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68704 (= res!254243 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8173 a1!566) (size!8173 a2!566)) (bvsle to!659 (size!8173 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68704 e!222855))

(assert (=> start!68704 true))

(declare-fun e!222856 () Bool)

(declare-fun array_inv!7740 (array!18839) Bool)

(assert (=> start!68704 (and (array_inv!7740 a2!566) e!222856)))

(declare-fun e!222857 () Bool)

(assert (=> start!68704 (and (array_inv!7740 a1!566) e!222857)))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun b!310038 () Bool)

(assert (=> b!310038 (= e!222855 (and (= i!943 at!235) (not (= (select (arr!9256 a1!566) at!235) (select (arr!9256 a2!566) at!235)))))))

(declare-fun b!310039 () Bool)

(assert (=> b!310039 (= e!222856 (and tp_is_empty!973 mapRes!3091))))

(declare-fun condMapEmpty!3092 () Bool)

(declare-fun mapDefault!3092 () T!58419)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68674 () Bool)

(assert start!68674)

(declare-fun mapIsEmpty!3001 () Bool)

(declare-fun mapRes!3001 () Bool)

(assert (=> mapIsEmpty!3001 mapRes!3001))

(declare-fun res!254076 () Bool)

(declare-fun e!222720 () Bool)

(assert (=> start!68674 (=> (not res!254076) (not e!222720))))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58289 0))(
  ( (T!58290 (val!471 Int)) )
))
(declare-datatypes ((array!18809 0))(
  ( (array!18810 (arr!9241 (Array (_ BitVec 32) T!58289)) (size!8158 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18809)

(declare-fun a1!566 () array!18809)

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68674 (= res!254076 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8158 a1!566) (size!8158 a2!566)) (bvsle to!659 (size!8158 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68674 e!222720))

(assert (=> start!68674 true))

(declare-fun e!222721 () Bool)

(declare-fun array_inv!7730 (array!18809) Bool)

(assert (=> start!68674 (and (array_inv!7730 a2!566) e!222721)))

(declare-fun e!222722 () Bool)

(assert (=> start!68674 (and (array_inv!7730 a1!566) e!222722)))

(declare-fun mapNonEmpty!3001 () Bool)

(declare-fun tp!3002 () Bool)

(declare-fun tp_is_empty!943 () Bool)

(assert (=> mapNonEmpty!3001 (= mapRes!3001 (and tp!3002 tp_is_empty!943))))

(declare-fun mapKey!3001 () (_ BitVec 32))

(declare-fun mapValue!3002 () T!58289)

(declare-fun mapRest!3001 () (Array (_ BitVec 32) T!58289))

(assert (=> mapNonEmpty!3001 (= (arr!9241 a1!566) (store mapRest!3001 mapKey!3001 mapValue!3002))))

(declare-fun b!309782 () Bool)

(declare-fun res!254077 () Bool)

(assert (=> b!309782 (=> (not res!254077) (not e!222720))))

(declare-fun arrayRangesEq!1764 (array!18809 array!18809 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309782 (= res!254077 (arrayRangesEq!1764 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3002 () Bool)

(declare-fun mapRes!3002 () Bool)

(assert (=> mapIsEmpty!3002 mapRes!3002))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun b!309783 () Bool)

(assert (=> b!309783 (= e!222720 (and (bvsle from!692 i!943) (bvsle i!943 at!235) (or (bvsgt #b00000000000000000000000000000000 i!943) (bvsgt i!943 to!659))))))

(declare-fun b!309784 () Bool)

(assert (=> b!309784 (= e!222722 (and tp_is_empty!943 mapRes!3001))))

(declare-fun condMapEmpty!3001 () Bool)

(declare-fun mapDefault!3002 () T!58289)


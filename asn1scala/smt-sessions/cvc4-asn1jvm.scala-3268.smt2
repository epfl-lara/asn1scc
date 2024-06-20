; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74094 () Bool)

(assert start!74094)

(declare-fun b!326868 () Bool)

(declare-fun e!236156 () Bool)

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66649 0))(
  ( (T!66650 (val!551 Int)) )
))
(declare-datatypes ((array!21325 0))(
  ( (array!21326 (arr!10347 (Array (_ BitVec 32) T!66649)) (size!9255 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21325)

(assert (=> b!326868 (= e!236156 (and (not (= i!907 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 (bvsub i!907 #b00000000000000000000000000000001)) (bvsgt (bvsub i!907 #b00000000000000000000000000000001) (size!9255 a!407)))))))

(declare-fun b!326869 () Bool)

(declare-fun res!268350 () Bool)

(assert (=> b!326869 (=> (not res!268350) (not e!236156))))

(declare-fun arrayRangesEq!1866 (array!21325 array!21325 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!326869 (= res!268350 (arrayRangesEq!1866 a!407 a!407 i!907 (size!9255 a!407)))))

(declare-fun res!268349 () Bool)

(assert (=> start!74094 (=> (not res!268349) (not e!236156))))

(assert (=> start!74094 (= res!268349 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9255 a!407))))))

(assert (=> start!74094 e!236156))

(assert (=> start!74094 true))

(declare-fun e!236155 () Bool)

(declare-fun array_inv!8803 (array!21325) Bool)

(assert (=> start!74094 (and (array_inv!8803 a!407) e!236155)))

(declare-fun b!326870 () Bool)

(declare-fun tp_is_empty!1103 () Bool)

(declare-fun mapRes!3379 () Bool)

(assert (=> b!326870 (= e!236155 (and tp_is_empty!1103 mapRes!3379))))

(declare-fun condMapEmpty!3379 () Bool)

(declare-fun mapDefault!3379 () T!66649)


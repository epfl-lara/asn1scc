; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70384 () Bool)

(assert start!70384)

(declare-fun b!318810 () Bool)

(declare-fun res!261868 () Bool)

(declare-fun e!229081 () Bool)

(assert (=> b!318810 (=> (not res!261868) (not e!229081))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318810 (= res!261868 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318809 () Bool)

(declare-fun res!261865 () Bool)

(assert (=> b!318809 (=> (not res!261865) (not e!229081))))

(declare-datatypes ((array!19849 0))(
  ( (array!19850 (arr!9733 (Array (_ BitVec 32) (_ BitVec 8))) (size!8644 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19849)

(declare-fun a2!909 () array!19849)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19849 array!19849 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318809 (= res!261865 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun res!261867 () Bool)

(assert (=> start!70384 (=> (not res!261867) (not e!229081))))

(assert (=> start!70384 (= res!261867 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8644 a1!909) (size!8644 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8644 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70384 e!229081))

(assert (=> start!70384 true))

(declare-fun array_inv!8196 (array!19849) Bool)

(assert (=> start!70384 (array_inv!8196 a1!909)))

(assert (=> start!70384 (array_inv!8196 a2!909)))

(declare-fun b!318811 () Bool)

(declare-fun res!261866 () Bool)

(assert (=> b!318811 (=> (not res!261866) (not e!229081))))

(assert (=> b!318811 (= res!261866 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318812 () Bool)

(assert (=> b!318812 (= e!229081 (and (= i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvsge at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8644 a1!909)))))))))

(assert (= (and start!70384 res!261867) b!318809))

(assert (= (and b!318809 res!261865) b!318810))

(assert (= (and b!318810 res!261868) b!318811))

(assert (= (and b!318811 res!261866) b!318812))

(declare-fun m!457073 () Bool)

(assert (=> b!318809 m!457073))

(declare-fun m!457075 () Bool)

(assert (=> start!70384 m!457075))

(declare-fun m!457077 () Bool)

(assert (=> start!70384 m!457077))

(declare-fun m!457079 () Bool)

(assert (=> b!318811 m!457079))

(push 1)

(assert (not start!70384))

(assert (not b!318811))

(assert (not b!318809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


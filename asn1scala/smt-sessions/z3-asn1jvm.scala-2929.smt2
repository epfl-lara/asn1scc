; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69738 () Bool)

(assert start!69738)

(declare-fun b!313792 () Bool)

(declare-fun res!256941 () Bool)

(declare-fun e!225929 () Bool)

(assert (=> b!313792 (=> (not res!256941) (not e!225929))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19302 0))(
  ( (array!19303 (arr!9455 (Array (_ BitVec 32) (_ BitVec 8))) (size!8375 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19302)

(declare-fun a2!825 () array!19302)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19302 array!19302 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313792 (= res!256941 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!256938 () Bool)

(assert (=> start!69738 (=> (not res!256938) (not e!225929))))

(declare-fun a3!79 () array!19302)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69738 (= res!256938 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8375 a1!825) (size!8375 a2!825)) (= (size!8375 a2!825) (size!8375 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8375 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8375 a2!825))))))))

(assert (=> start!69738 e!225929))

(assert (=> start!69738 true))

(declare-fun array_inv!7927 (array!19302) Bool)

(assert (=> start!69738 (array_inv!7927 a1!825)))

(assert (=> start!69738 (array_inv!7927 a3!79)))

(assert (=> start!69738 (array_inv!7927 a2!825)))

(declare-fun b!313793 () Bool)

(declare-fun res!256940 () Bool)

(assert (=> b!313793 (=> (not res!256940) (not e!225929))))

(assert (=> b!313793 (= res!256940 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313794 () Bool)

(declare-fun res!256943 () Bool)

(assert (=> b!313794 (=> (not res!256943) (not e!225929))))

(assert (=> b!313794 (= res!256943 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313795 () Bool)

(declare-fun res!256942 () Bool)

(assert (=> b!313795 (=> (not res!256942) (not e!225929))))

(assert (=> b!313795 (= res!256942 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313796 () Bool)

(declare-fun res!256939 () Bool)

(assert (=> b!313796 (=> (not res!256939) (not e!225929))))

(assert (=> b!313796 (= res!256939 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313797 () Bool)

(assert (=> b!313797 (= e!225929 (and (bvsle (size!8375 a1!825) (size!8375 a3!79)) (bvsgt i!1020 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8375 a1!825))))))))

(assert (= (and start!69738 res!256938) b!313795))

(assert (= (and b!313795 res!256942) b!313794))

(assert (= (and b!313794 res!256943) b!313796))

(assert (= (and b!313796 res!256939) b!313792))

(assert (= (and b!313792 res!256941) b!313793))

(assert (= (and b!313793 res!256940) b!313797))

(declare-fun m!451417 () Bool)

(assert (=> b!313794 m!451417))

(declare-fun m!451419 () Bool)

(assert (=> b!313793 m!451419))

(declare-fun m!451421 () Bool)

(assert (=> b!313795 m!451421))

(declare-fun m!451423 () Bool)

(assert (=> b!313792 m!451423))

(declare-fun m!451425 () Bool)

(assert (=> start!69738 m!451425))

(declare-fun m!451427 () Bool)

(assert (=> start!69738 m!451427))

(declare-fun m!451429 () Bool)

(assert (=> start!69738 m!451429))

(check-sat (not start!69738) (not b!313795) (not b!313792) (not b!313793) (not b!313794))
(check-sat)

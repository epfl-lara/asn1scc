; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66890 () Bool)

(assert start!66890)

(declare-fun b!299030 () Bool)

(declare-fun res!246791 () Bool)

(declare-fun e!214589 () Bool)

(assert (=> b!299030 (=> (not res!246791) (not e!214589))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!299030 (= res!246791 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!299031 () Bool)

(assert (=> b!299031 (= e!214589 (not true))))

(declare-datatypes ((array!18117 0))(
  ( (array!18118 (arr!8946 (Array (_ BitVec 32) (_ BitVec 8))) (size!7863 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18117)

(declare-fun lt!434974 () array!18117)

(declare-fun arrayBitRangesEq!0 (array!18117 array!18117 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299031 (arrayBitRangesEq!0 a!434 lt!434974 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20867 0))(
  ( (Unit!20868) )
))
(declare-fun lt!434975 () Unit!20867)

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18117 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20867)

(assert (=> b!299031 (= lt!434975 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!299032 () Bool)

(declare-fun e!214590 () Bool)

(declare-fun e!214588 () Bool)

(assert (=> b!299032 (= e!214590 e!214588)))

(declare-fun res!246792 () Bool)

(assert (=> b!299032 (=> (not res!246792) (not e!214588))))

(assert (=> b!299032 (= res!246792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434976 () (_ BitVec 32))

(assert (=> b!299032 (= lt!434976 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434973 () (_ BitVec 32))

(assert (=> b!299032 (= lt!434973 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!246793 () Bool)

(assert (=> start!66890 (=> (not res!246793) (not e!214590))))

(assert (=> start!66890 (= res!246793 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7863 a!434))))))))

(assert (=> start!66890 e!214590))

(assert (=> start!66890 true))

(declare-fun array_inv!7475 (array!18117) Bool)

(assert (=> start!66890 (array_inv!7475 a!434)))

(declare-fun b!299033 () Bool)

(declare-fun res!246794 () Bool)

(assert (=> b!299033 (=> (not res!246794) (not e!214589))))

(assert (=> b!299033 (= res!246794 (arrayBitRangesEq!0 a!434 lt!434974 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!299034 () Bool)

(assert (=> b!299034 (= e!214588 e!214589)))

(declare-fun res!246790 () Bool)

(assert (=> b!299034 (=> (not res!246790) (not e!214589))))

(assert (=> b!299034 (= res!246790 (arrayBitRangesEq!0 a!434 lt!434974 i!1010 at!286))))

(assert (=> b!299034 (= lt!434974 (array!18118 (store (arr!8946 a!434) lt!434973 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8946 a!434) lt!434973)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434976)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434976) #b00000000))))) (size!7863 a!434)))))

(assert (= (and start!66890 res!246793) b!299032))

(assert (= (and b!299032 res!246792) b!299034))

(assert (= (and b!299034 res!246790) b!299030))

(assert (= (and b!299030 res!246791) b!299033))

(assert (= (and b!299033 res!246794) b!299031))

(declare-fun m!438285 () Bool)

(assert (=> b!299031 m!438285))

(declare-fun m!438287 () Bool)

(assert (=> b!299031 m!438287))

(declare-fun m!438289 () Bool)

(assert (=> start!66890 m!438289))

(declare-fun m!438291 () Bool)

(assert (=> b!299033 m!438291))

(declare-fun m!438293 () Bool)

(assert (=> b!299034 m!438293))

(declare-fun m!438295 () Bool)

(assert (=> b!299034 m!438295))

(declare-fun m!438297 () Bool)

(assert (=> b!299034 m!438297))

(declare-fun m!438299 () Bool)

(assert (=> b!299034 m!438299))

(push 1)


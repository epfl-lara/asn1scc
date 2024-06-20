; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66880 () Bool)

(assert start!66880)

(declare-fun b!298955 () Bool)

(declare-fun res!246717 () Bool)

(declare-fun e!214528 () Bool)

(assert (=> b!298955 (=> (not res!246717) (not e!214528))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298955 (= res!246717 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298956 () Bool)

(declare-fun res!246715 () Bool)

(assert (=> b!298956 (=> (not res!246715) (not e!214528))))

(declare-datatypes ((array!18107 0))(
  ( (array!18108 (arr!8941 (Array (_ BitVec 32) (_ BitVec 8))) (size!7858 (_ BitVec 32))) )
))
(declare-fun lt!434916 () array!18107)

(declare-fun a!434 () array!18107)

(declare-fun arrayBitRangesEq!0 (array!18107 array!18107 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298956 (= res!246715 (arrayBitRangesEq!0 a!434 lt!434916 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun res!246718 () Bool)

(declare-fun e!214527 () Bool)

(assert (=> start!66880 (=> (not res!246718) (not e!214527))))

(assert (=> start!66880 (= res!246718 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7858 a!434))))))))

(assert (=> start!66880 e!214527))

(assert (=> start!66880 true))

(declare-fun array_inv!7470 (array!18107) Bool)

(assert (=> start!66880 (array_inv!7470 a!434)))

(declare-fun b!298957 () Bool)

(declare-fun lt!434915 () (_ BitVec 32))

(assert (=> b!298957 (= e!214528 (not (and (bvsge lt!434915 #b00000000000000000000000000000000) (bvslt lt!434915 (size!7858 a!434)))))))

(assert (=> b!298957 (arrayBitRangesEq!0 a!434 lt!434916 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20857 0))(
  ( (Unit!20858) )
))
(declare-fun lt!434913 () Unit!20857)

(declare-fun b!320 () Bool)

(declare-fun rec!19 (array!18107 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20857)

(assert (=> b!298957 (= lt!434913 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!298958 () Bool)

(declare-fun e!214529 () Bool)

(assert (=> b!298958 (= e!214527 e!214529)))

(declare-fun res!246719 () Bool)

(assert (=> b!298958 (=> (not res!246719) (not e!214529))))

(assert (=> b!298958 (= res!246719 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434914 () (_ BitVec 32))

(assert (=> b!298958 (= lt!434914 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298958 (= lt!434915 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298959 () Bool)

(assert (=> b!298959 (= e!214529 e!214528)))

(declare-fun res!246716 () Bool)

(assert (=> b!298959 (=> (not res!246716) (not e!214528))))

(assert (=> b!298959 (= res!246716 (arrayBitRangesEq!0 a!434 lt!434916 i!1010 at!286))))

(assert (=> b!298959 (= lt!434916 (array!18108 (store (arr!8941 a!434) lt!434915 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8941 a!434) lt!434915)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434914)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434914) #b00000000))))) (size!7858 a!434)))))

(assert (= (and start!66880 res!246718) b!298958))

(assert (= (and b!298958 res!246719) b!298959))

(assert (= (and b!298959 res!246716) b!298955))

(assert (= (and b!298955 res!246717) b!298956))

(assert (= (and b!298956 res!246715) b!298957))

(declare-fun m!438205 () Bool)

(assert (=> b!298956 m!438205))

(declare-fun m!438207 () Bool)

(assert (=> start!66880 m!438207))

(declare-fun m!438209 () Bool)

(assert (=> b!298957 m!438209))

(declare-fun m!438211 () Bool)

(assert (=> b!298957 m!438211))

(declare-fun m!438213 () Bool)

(assert (=> b!298959 m!438213))

(declare-fun m!438215 () Bool)

(assert (=> b!298959 m!438215))

(declare-fun m!438217 () Bool)

(assert (=> b!298959 m!438217))

(declare-fun m!438219 () Bool)

(assert (=> b!298959 m!438219))

(push 1)

(assert (not b!298957))

(assert (not start!66880))

(assert (not b!298959))

(assert (not b!298956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66874 () Bool)

(assert start!66874)

(declare-fun res!246674 () Bool)

(declare-fun e!214494 () Bool)

(assert (=> start!66874 (=> (not res!246674) (not e!214494))))

(declare-fun at!286 () (_ BitVec 64))

(declare-datatypes ((array!18101 0))(
  ( (array!18102 (arr!8938 (Array (_ BitVec 32) (_ BitVec 8))) (size!7855 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18101)

(assert (=> start!66874 (= res!246674 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7855 a!434))))))))

(assert (=> start!66874 e!214494))

(assert (=> start!66874 true))

(declare-fun array_inv!7467 (array!18101) Bool)

(assert (=> start!66874 (array_inv!7467 a!434)))

(declare-fun b!298910 () Bool)

(declare-fun res!246672 () Bool)

(declare-fun e!214492 () Bool)

(assert (=> b!298910 (=> (not res!246672) (not e!214492))))

(declare-fun lt!434884 () array!18101)

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!18101 array!18101 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298910 (= res!246672 (arrayBitRangesEq!0 a!434 lt!434884 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298911 () Bool)

(declare-fun res!246671 () Bool)

(assert (=> b!298911 (=> (not res!246671) (not e!214492))))

(assert (=> b!298911 (= res!246671 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(declare-fun b!298912 () Bool)

(declare-fun e!214493 () Bool)

(assert (=> b!298912 (= e!214493 e!214492)))

(declare-fun res!246673 () Bool)

(assert (=> b!298912 (=> (not res!246673) (not e!214492))))

(assert (=> b!298912 (= res!246673 (arrayBitRangesEq!0 a!434 lt!434884 i!1010 at!286))))

(declare-fun lt!434886 () (_ BitVec 32))

(declare-fun lt!434885 () (_ BitVec 32))

(declare-fun b!320 () Bool)

(assert (=> b!298912 (= lt!434884 (array!18102 (store (arr!8938 a!434) lt!434885 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8938 a!434) lt!434885)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434886)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434886) #b00000000))))) (size!7855 a!434)))))

(declare-fun b!298913 () Bool)

(assert (=> b!298913 (= e!214494 e!214493)))

(declare-fun res!246670 () Bool)

(assert (=> b!298913 (=> (not res!246670) (not e!214493))))

(assert (=> b!298913 (= res!246670 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(assert (=> b!298913 (= lt!434886 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298913 (= lt!434885 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298914 () Bool)

(assert (=> b!298914 (= e!214492 (bvsge (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) i!1010))))

(assert (= (and start!66874 res!246674) b!298913))

(assert (= (and b!298913 res!246670) b!298912))

(assert (= (and b!298912 res!246673) b!298911))

(assert (= (and b!298911 res!246671) b!298910))

(assert (= (and b!298910 res!246672) b!298914))

(declare-fun m!438169 () Bool)

(assert (=> start!66874 m!438169))

(declare-fun m!438171 () Bool)

(assert (=> b!298910 m!438171))

(declare-fun m!438173 () Bool)

(assert (=> b!298912 m!438173))

(declare-fun m!438175 () Bool)

(assert (=> b!298912 m!438175))

(declare-fun m!438177 () Bool)

(assert (=> b!298912 m!438177))

(declare-fun m!438179 () Bool)

(assert (=> b!298912 m!438179))

(push 1)

(assert (not start!66874))

(assert (not b!298912))

(assert (not b!298910))

(check-sat)

(pop 1)

(push 1)

(check-sat)


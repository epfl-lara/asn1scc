; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66782 () Bool)

(assert start!66782)

(declare-fun res!246274 () Bool)

(declare-fun e!214086 () Bool)

(assert (=> start!66782 (=> (not res!246274) (not e!214086))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18036 0))(
  ( (array!18037 (arr!8907 (Array (_ BitVec 32) (_ BitVec 8))) (size!7824 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18036)

(assert (=> start!66782 (= res!246274 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7824 a!429))))))))

(assert (=> start!66782 e!214086))

(assert (=> start!66782 true))

(declare-fun array_inv!7436 (array!18036) Bool)

(assert (=> start!66782 (array_inv!7436 a!429)))

(declare-fun b!298490 () Bool)

(declare-fun e!214084 () Bool)

(assert (=> b!298490 (= e!214086 e!214084)))

(declare-fun res!246275 () Bool)

(assert (=> b!298490 (=> (not res!246275) (not e!214084))))

(declare-fun lt!434625 () array!18036)

(declare-fun arrayBitRangesEq!0 (array!18036 array!18036 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298490 (= res!246275 (arrayBitRangesEq!0 a!429 lt!434625 at!281 at!281))))

(declare-fun lt!434622 () (_ BitVec 32))

(declare-fun lt!434623 () (_ BitVec 32))

(declare-fun b!315 () Bool)

(assert (=> b!298490 (= lt!434625 (array!18037 (store (arr!8907 a!429) lt!434623 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8907 a!429) lt!434623)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434622)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434622) #b00000000))))) (size!7824 a!429)))))

(assert (=> b!298490 (= lt!434622 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298490 (= lt!434623 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298491 () Bool)

(assert (=> b!298491 (= e!214084 (not true))))

(assert (=> b!298491 (arrayBitRangesEq!0 a!429 lt!434625 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20843 0))(
  ( (Unit!20844) )
))
(declare-fun lt!434624 () Unit!20843)

(declare-fun rec!19 (array!18036 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20843)

(assert (=> b!298491 (= lt!434624 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66782 res!246274) b!298490))

(assert (= (and b!298490 res!246275) b!298491))

(declare-fun m!437645 () Bool)

(assert (=> start!66782 m!437645))

(declare-fun m!437647 () Bool)

(assert (=> b!298490 m!437647))

(declare-fun m!437649 () Bool)

(assert (=> b!298490 m!437649))

(declare-fun m!437651 () Bool)

(assert (=> b!298490 m!437651))

(declare-fun m!437653 () Bool)

(assert (=> b!298490 m!437653))

(declare-fun m!437655 () Bool)

(assert (=> b!298491 m!437655))

(declare-fun m!437657 () Bool)

(assert (=> b!298491 m!437657))

(push 1)

(assert (not b!298491))

(assert (not start!66782))

(assert (not b!298490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


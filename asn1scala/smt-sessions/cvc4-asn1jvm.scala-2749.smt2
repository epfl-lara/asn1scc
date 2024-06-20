; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66800 () Bool)

(assert start!66800)

(declare-fun b!298568 () Bool)

(declare-fun e!214166 () Bool)

(declare-fun e!214167 () Bool)

(assert (=> b!298568 (= e!214166 e!214167)))

(declare-fun res!246354 () Bool)

(assert (=> b!298568 (=> (not res!246354) (not e!214167))))

(declare-fun i!1010 () (_ BitVec 64))

(declare-fun at!286 () (_ BitVec 64))

(assert (=> b!298568 (= res!246354 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1010) (bvsle i!1010 at!286)))))

(declare-fun lt!434688 () (_ BitVec 32))

(assert (=> b!298568 (= lt!434688 ((_ extract 31 0) (bvsrem at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!434686 () (_ BitVec 32))

(assert (=> b!298568 (= lt!434686 ((_ extract 31 0) (bvsdiv at!286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun res!246353 () Bool)

(assert (=> start!66800 (=> (not res!246353) (not e!214166))))

(declare-datatypes ((array!18054 0))(
  ( (array!18055 (arr!8916 (Array (_ BitVec 32) (_ BitVec 8))) (size!7833 (_ BitVec 32))) )
))
(declare-fun a!434 () array!18054)

(assert (=> start!66800 (= res!246353 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!286) (bvslt at!286 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7833 a!434))))))))

(assert (=> start!66800 e!214166))

(assert (=> start!66800 true))

(declare-fun array_inv!7445 (array!18054) Bool)

(assert (=> start!66800 (array_inv!7445 a!434)))

(declare-fun b!298569 () Bool)

(declare-fun res!246356 () Bool)

(declare-fun e!214164 () Bool)

(assert (=> b!298569 (=> (not res!246356) (not e!214164))))

(declare-fun lt!434685 () array!18054)

(declare-fun arrayBitRangesEq!0 (array!18054 array!18054 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298569 (= res!246356 (arrayBitRangesEq!0 a!434 lt!434685 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286))))

(declare-fun b!298570 () Bool)

(assert (=> b!298570 (= e!214167 e!214164)))

(declare-fun res!246355 () Bool)

(assert (=> b!298570 (=> (not res!246355) (not e!214164))))

(assert (=> b!298570 (= res!246355 (arrayBitRangesEq!0 a!434 lt!434685 i!1010 at!286))))

(declare-fun b!320 () Bool)

(assert (=> b!298570 (= lt!434685 (array!18055 (store (arr!8916 a!434) lt!434686 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8916 a!434) lt!434686)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434688)))) ((_ sign_extend 24) (ite b!320 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434688) #b00000000))))) (size!7833 a!434)))))

(declare-fun b!298571 () Bool)

(assert (=> b!298571 (= e!214164 (not true))))

(assert (=> b!298571 (arrayBitRangesEq!0 a!434 lt!434685 #b0000000000000000000000000000000000000000000000000000000000000000 at!286)))

(declare-datatypes ((Unit!20849 0))(
  ( (Unit!20850) )
))
(declare-fun lt!434687 () Unit!20849)

(declare-fun rec!19 (array!18054 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20849)

(assert (=> b!298571 (= lt!434687 (rec!19 a!434 at!286 b!320 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!298572 () Bool)

(declare-fun res!246352 () Bool)

(assert (=> b!298572 (=> (not res!246352) (not e!214164))))

(assert (=> b!298572 (= res!246352 (and (not (= i!1010 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1010 #b0000000000000000000000000000000000000000000000000000000000000001) at!286)))))

(assert (= (and start!66800 res!246353) b!298568))

(assert (= (and b!298568 res!246354) b!298570))

(assert (= (and b!298570 res!246355) b!298572))

(assert (= (and b!298572 res!246352) b!298569))

(assert (= (and b!298569 res!246356) b!298571))

(declare-fun m!437727 () Bool)

(assert (=> start!66800 m!437727))

(declare-fun m!437729 () Bool)

(assert (=> b!298569 m!437729))

(declare-fun m!437731 () Bool)

(assert (=> b!298570 m!437731))

(declare-fun m!437733 () Bool)

(assert (=> b!298570 m!437733))

(declare-fun m!437735 () Bool)

(assert (=> b!298570 m!437735))

(declare-fun m!437737 () Bool)

(assert (=> b!298570 m!437737))

(declare-fun m!437739 () Bool)

(assert (=> b!298571 m!437739))

(declare-fun m!437741 () Bool)

(assert (=> b!298571 m!437741))

(push 1)


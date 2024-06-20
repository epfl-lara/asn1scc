; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37486 () Bool)

(assert start!37486)

(declare-fun res!141080 () Bool)

(declare-fun e!118449 () Bool)

(assert (=> start!37486 (=> (not res!141080) (not e!118449))))

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(declare-fun i!474 () (_ BitVec 32))

(declare-datatypes ((Unit!11942 0))(
  ( (Unit!11943) )
))
(declare-datatypes ((ControlFlow!79 0))(
  ( (Return!78 (value!6922 (_ BitVec 64))) (Proceed!78 (value!6923 Unit!11942)) )
))
(declare-fun Unit!11944 () Unit!11942)

(assert (=> start!37486 (= res!141080 (and (bvsge uintSizeInBytes!5 #b00000000000000000000000000000001) (bvsle uintSizeInBytes!5 #b00000000000000000000000000001001) (not (is-Return!78 (ite (bvsle (bvand v!147 (bvshl #b0000000000000000000000000000000000000000000000000000000010000000 ((_ sign_extend 32) (bvmul #b00000000000000000000000000001000 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000) (Return!78 v!147) (Proceed!78 Unit!11944)))) (bvsle i!474 #b00000000000000000000000000000111) (bvsge i!474 (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)) (bvsge i!474 uintSizeInBytes!5) (bvsge (bvsub i!474 #b00000000000000000000000000000001) uintSizeInBytes!5)))))

(assert (=> start!37486 e!118449))

(assert (=> start!37486 true))

(declare-fun b!169773 () Bool)

(declare-datatypes ((tuple3!990 0))(
  ( (tuple3!991 (_1!7951 Unit!11942) (_2!7951 (_ BitVec 32)) (_3!621 (_ BitVec 64))) )
))
(declare-fun lt!262276 () tuple3!990)

(assert (=> b!169773 (= e!118449 (or (bvsgt (_2!7951 lt!262276) #b00000000000000000000000000000111) (bvslt (_2!7951 lt!262276) (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001))))))

(declare-fun vv!30 () (_ BitVec 64))

(declare-fun uint2intWhile!0 ((_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 64)) tuple3!990)

(assert (=> b!169773 (= lt!262276 (uint2intWhile!0 uintSizeInBytes!5 v!147 (bvsub i!474 #b00000000000000000000000000000001) (bvor vv!30 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000011111111) #b00000000000000000000000000000001 #b0000000000000000000000000000000000000000000000001111111100000000) #b00000000000000000000000000000010 #b0000000000000000000000000000000000000000111111110000000000000000) #b00000000000000000000000000000011 #b0000000000000000000000000000000011111111000000000000000000000000) #b00000000000000000000000000000100 #b0000000000000000000000001111111100000000000000000000000000000000) #b00000000000000000000000000000101 #b0000000000000000111111110000000000000000000000000000000000000000) #b00000000000000000000000000000110 #b0000000011111111000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b1111111100000000000000000000000000000000000000000000000000000000) i!474))))))

(assert (= (and start!37486 res!141080) b!169773))

(declare-fun m!269553 () Bool)

(assert (=> b!169773 m!269553))

(declare-fun m!269555 () Bool)

(assert (=> b!169773 m!269555))

(push 1)

(assert (not b!169773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!169802 () Bool)

(declare-fun res!141098 () Bool)

(declare-fun e!118466 () Bool)

(assert (=> b!169802 (=> (not res!141098) (not e!118466))))

(declare-fun lt!262305 () tuple3!990)

(assert (=> b!169802 (= res!141098 (bvsge (_2!7951 lt!262305) (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001)))))

(assert (=> b!169802 (or (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand uintSizeInBytes!5 #b10000000000000000000000000000000) (bvand (bvsub uintSizeInBytes!5 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!169800 () Bool)

(declare-fun lt!262304 () (_ BitVec 32))

(declare-fun lt!262303 () (_ BitVec 64))

(declare-fun e!118467 () tuple3!990)

(assert (=> b!169800 (= e!118467 (uint2intWhile!0 uintSizeInBytes!5 v!147 lt!262304 lt!262303))))

(declare-fun b!169801 () Bool)

(declare-fun Unit!11952 () Unit!11942)

(assert (=> b!169801 (= e!118467 (tuple3!991 Unit!11952 lt!262304 lt!262303))))

(declare-fun d!60003 () Bool)

(assert (=> d!60003 e!118466))

(declare-fun res!141097 () Bool)

(assert (=> d!60003 (=> (not res!141097) (not e!118466))))

(declare-fun lt!262306 () (_ BitVec 32))

(assert (=> d!60003 (= res!141097 (bvsle (_2!7951 lt!262305) (bvsub lt!262306 #b00000000000000000000000000000001)))))


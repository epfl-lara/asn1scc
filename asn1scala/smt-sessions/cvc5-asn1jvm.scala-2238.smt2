; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56866 () Bool)

(assert start!56866)

(declare-fun res!218810 () Bool)

(declare-fun e!181859 () Bool)

(assert (=> start!56866 (=> (not res!218810) (not e!181859))))

(declare-datatypes ((array!14475 0))(
  ( (array!14476 (arr!7306 (Array (_ BitVec 32) (_ BitVec 8))) (size!6319 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11560 0))(
  ( (BitStream!11561 (buf!6841 array!14475) (currentByte!12639 (_ BitVec 32)) (currentBit!12634 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11560)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56866 (= res!218810 (validate_offset_bit!0 ((_ sign_extend 32) (size!6319 (buf!6841 thiss!914))) ((_ sign_extend 32) (currentByte!12639 thiss!914)) ((_ sign_extend 32) (currentBit!12634 thiss!914))))))

(assert (=> start!56866 e!181859))

(declare-fun e!181861 () Bool)

(declare-fun inv!12 (BitStream!11560) Bool)

(assert (=> start!56866 (and (inv!12 thiss!914) e!181861)))

(assert (=> start!56866 true))

(declare-fun b!261409 () Bool)

(declare-datatypes ((Unit!18609 0))(
  ( (Unit!18610) )
))
(declare-datatypes ((tuple2!22364 0))(
  ( (tuple2!22365 (_1!12118 Unit!18609) (_2!12118 BitStream!11560)) )
))
(declare-fun lt!403337 () tuple2!22364)

(assert (=> b!261409 (= e!181859 (or (bvslt (currentByte!12639 (_2!12118 lt!403337)) #b00000000000000000000000000000000) (bvsge (currentByte!12639 (_2!12118 lt!403337)) (size!6319 (buf!6841 (_2!12118 lt!403337))))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18611 () Unit!18609)

(declare-fun Unit!18612 () Unit!18609)

(assert (=> b!261409 (= lt!403337 (ite b!187 (tuple2!22365 Unit!18611 (BitStream!11561 (array!14476 (store (arr!7306 (buf!6841 thiss!914)) (currentByte!12639 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7306 (buf!6841 thiss!914)) (currentByte!12639 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12634 thiss!914)))))) (size!6319 (buf!6841 thiss!914))) (currentByte!12639 thiss!914) (currentBit!12634 thiss!914))) (tuple2!22365 Unit!18612 (BitStream!11561 (array!14476 (store (arr!7306 (buf!6841 thiss!914)) (currentByte!12639 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7306 (buf!6841 thiss!914)) (currentByte!12639 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12634 thiss!914))))))) (size!6319 (buf!6841 thiss!914))) (currentByte!12639 thiss!914) (currentBit!12634 thiss!914)))))))

(declare-fun b!261410 () Bool)

(declare-fun array_inv!6060 (array!14475) Bool)

(assert (=> b!261410 (= e!181861 (array_inv!6060 (buf!6841 thiss!914)))))

(assert (= (and start!56866 res!218810) b!261409))

(assert (= start!56866 b!261410))

(declare-fun m!391189 () Bool)

(assert (=> start!56866 m!391189))

(declare-fun m!391191 () Bool)

(assert (=> start!56866 m!391191))

(declare-fun m!391193 () Bool)

(assert (=> b!261409 m!391193))

(declare-fun m!391195 () Bool)

(assert (=> b!261409 m!391195))

(declare-fun m!391197 () Bool)

(assert (=> b!261409 m!391197))

(declare-fun m!391199 () Bool)

(assert (=> b!261409 m!391199))

(declare-fun m!391201 () Bool)

(assert (=> b!261410 m!391201))

(push 1)

(assert (not start!56866))

(assert (not b!261410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88068 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88068 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6319 (buf!6841 thiss!914))) ((_ sign_extend 32) (currentByte!12639 thiss!914)) ((_ sign_extend 32) (currentBit!12634 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6319 (buf!6841 thiss!914))) ((_ sign_extend 32) (currentByte!12639 thiss!914)) ((_ sign_extend 32) (currentBit!12634 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22325 () Bool)

(assert (= bs!22325 d!88068))

(declare-fun m!391235 () Bool)

(assert (=> bs!22325 m!391235))

(assert (=> start!56866 d!88068))

(declare-fun d!88072 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88072 (= (inv!12 thiss!914) (invariant!0 (currentBit!12634 thiss!914) (currentByte!12639 thiss!914) (size!6319 (buf!6841 thiss!914))))))

(declare-fun bs!22326 () Bool)

(assert (= bs!22326 d!88072))

(declare-fun m!391237 () Bool)

(assert (=> bs!22326 m!391237))

(assert (=> start!56866 d!88072))

(declare-fun d!88074 () Bool)

(assert (=> d!88074 (= (array_inv!6060 (buf!6841 thiss!914)) (bvsge (size!6319 (buf!6841 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261410 d!88074))

(push 1)

(assert (not d!88068))

(assert (not d!88072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88086 () Bool)

(assert (=> d!88086 (= (remainingBits!0 ((_ sign_extend 32) (size!6319 (buf!6841 thiss!914))) ((_ sign_extend 32) (currentByte!12639 thiss!914)) ((_ sign_extend 32) (currentBit!12634 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6319 (buf!6841 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12639 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12634 thiss!914)))))))

(assert (=> d!88068 d!88086))

(declare-fun d!88088 () Bool)

(assert (=> d!88088 (= (invariant!0 (currentBit!12634 thiss!914) (currentByte!12639 thiss!914) (size!6319 (buf!6841 thiss!914))) (and (bvsge (currentBit!12634 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12634 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12639 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12639 thiss!914) (size!6319 (buf!6841 thiss!914))) (and (= (currentBit!12634 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12639 thiss!914) (size!6319 (buf!6841 thiss!914)))))))))

(assert (=> d!88072 d!88088))

(push 1)

(check-sat)

(pop 1)


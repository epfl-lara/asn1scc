; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56906 () Bool)

(assert start!56906)

(declare-fun res!218825 () Bool)

(declare-fun e!181905 () Bool)

(assert (=> start!56906 (=> (not res!218825) (not e!181905))))

(declare-datatypes ((array!14488 0))(
  ( (array!14489 (arr!7311 (Array (_ BitVec 32) (_ BitVec 8))) (size!6324 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11570 0))(
  ( (BitStream!11571 (buf!6846 array!14488) (currentByte!12653 (_ BitVec 32)) (currentBit!12648 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11570)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56906 (= res!218825 (validate_offset_bit!0 ((_ sign_extend 32) (size!6324 (buf!6846 thiss!914))) ((_ sign_extend 32) (currentByte!12653 thiss!914)) ((_ sign_extend 32) (currentBit!12648 thiss!914))))))

(assert (=> start!56906 e!181905))

(declare-fun e!181906 () Bool)

(declare-fun inv!12 (BitStream!11570) Bool)

(assert (=> start!56906 (and (inv!12 thiss!914) e!181906)))

(assert (=> start!56906 true))

(declare-fun b!261439 () Bool)

(declare-datatypes ((Unit!18629 0))(
  ( (Unit!18630) )
))
(declare-datatypes ((tuple2!22374 0))(
  ( (tuple2!22375 (_1!12123 Unit!18629) (_2!12123 BitStream!11570)) )
))
(declare-fun lt!403352 () tuple2!22374)

(assert (=> b!261439 (= e!181905 (or (bvsgt #b00000000000000000000000000000000 (currentByte!12653 (_2!12123 lt!403352))) (bvsge (currentByte!12653 (_2!12123 lt!403352)) (size!6324 (buf!6846 thiss!914)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18631 () Unit!18629)

(declare-fun Unit!18632 () Unit!18629)

(assert (=> b!261439 (= lt!403352 (ite b!187 (tuple2!22375 Unit!18631 (BitStream!11571 (array!14489 (store (arr!7311 (buf!6846 thiss!914)) (currentByte!12653 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7311 (buf!6846 thiss!914)) (currentByte!12653 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12648 thiss!914)))))) (size!6324 (buf!6846 thiss!914))) (currentByte!12653 thiss!914) (currentBit!12648 thiss!914))) (tuple2!22375 Unit!18632 (BitStream!11571 (array!14489 (store (arr!7311 (buf!6846 thiss!914)) (currentByte!12653 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7311 (buf!6846 thiss!914)) (currentByte!12653 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12648 thiss!914))))))) (size!6324 (buf!6846 thiss!914))) (currentByte!12653 thiss!914) (currentBit!12648 thiss!914)))))))

(declare-fun b!261440 () Bool)

(declare-fun array_inv!6065 (array!14488) Bool)

(assert (=> b!261440 (= e!181906 (array_inv!6065 (buf!6846 thiss!914)))))

(assert (= (and start!56906 res!218825) b!261439))

(assert (= start!56906 b!261440))

(declare-fun m!391271 () Bool)

(assert (=> start!56906 m!391271))

(declare-fun m!391273 () Bool)

(assert (=> start!56906 m!391273))

(declare-fun m!391275 () Bool)

(assert (=> b!261439 m!391275))

(declare-fun m!391277 () Bool)

(assert (=> b!261439 m!391277))

(declare-fun m!391279 () Bool)

(assert (=> b!261439 m!391279))

(declare-fun m!391281 () Bool)

(assert (=> b!261439 m!391281))

(declare-fun m!391283 () Bool)

(assert (=> b!261440 m!391283))

(push 1)

(assert (not b!261440))

(assert (not start!56906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88108 () Bool)

(assert (=> d!88108 (= (array_inv!6065 (buf!6846 thiss!914)) (bvsge (size!6324 (buf!6846 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261440 d!88108))

(declare-fun d!88110 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88110 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6324 (buf!6846 thiss!914))) ((_ sign_extend 32) (currentByte!12653 thiss!914)) ((_ sign_extend 32) (currentBit!12648 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6324 (buf!6846 thiss!914))) ((_ sign_extend 32) (currentByte!12653 thiss!914)) ((_ sign_extend 32) (currentBit!12648 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22336 () Bool)

(assert (= bs!22336 d!88110))

(declare-fun m!391293 () Bool)

(assert (=> bs!22336 m!391293))

(assert (=> start!56906 d!88110))

(declare-fun d!88112 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88112 (= (inv!12 thiss!914) (invariant!0 (currentBit!12648 thiss!914) (currentByte!12653 thiss!914) (size!6324 (buf!6846 thiss!914))))))

(declare-fun bs!22337 () Bool)

(assert (= bs!22337 d!88112))

(declare-fun m!391295 () Bool)

(assert (=> bs!22337 m!391295))

(assert (=> start!56906 d!88112))

(push 1)

(assert (not d!88110))

(assert (not d!88112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88122 () Bool)

(assert (=> d!88122 (= (remainingBits!0 ((_ sign_extend 32) (size!6324 (buf!6846 thiss!914))) ((_ sign_extend 32) (currentByte!12653 thiss!914)) ((_ sign_extend 32) (currentBit!12648 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6324 (buf!6846 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12653 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12648 thiss!914)))))))

(assert (=> d!88110 d!88122))

(declare-fun d!88124 () Bool)

(assert (=> d!88124 (= (invariant!0 (currentBit!12648 thiss!914) (currentByte!12653 thiss!914) (size!6324 (buf!6846 thiss!914))) (and (bvsge (currentBit!12648 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12648 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12653 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12653 thiss!914) (size!6324 (buf!6846 thiss!914))) (and (= (currentBit!12648 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12653 thiss!914) (size!6324 (buf!6846 thiss!914)))))))))

(assert (=> d!88112 d!88124))

(push 1)

(check-sat)

(pop 1)


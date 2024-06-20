; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56870 () Bool)

(assert start!56870)

(declare-fun res!218816 () Bool)

(declare-fun e!181877 () Bool)

(assert (=> start!56870 (=> (not res!218816) (not e!181877))))

(declare-datatypes ((array!14479 0))(
  ( (array!14480 (arr!7308 (Array (_ BitVec 32) (_ BitVec 8))) (size!6321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11564 0))(
  ( (BitStream!11565 (buf!6843 array!14479) (currentByte!12641 (_ BitVec 32)) (currentBit!12636 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11564)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56870 (= res!218816 (validate_offset_bit!0 ((_ sign_extend 32) (size!6321 (buf!6843 thiss!914))) ((_ sign_extend 32) (currentByte!12641 thiss!914)) ((_ sign_extend 32) (currentBit!12636 thiss!914))))))

(assert (=> start!56870 e!181877))

(declare-fun e!181878 () Bool)

(declare-fun inv!12 (BitStream!11564) Bool)

(assert (=> start!56870 (and (inv!12 thiss!914) e!181878)))

(assert (=> start!56870 true))

(declare-fun b!261421 () Bool)

(declare-datatypes ((Unit!18617 0))(
  ( (Unit!18618) )
))
(declare-datatypes ((tuple2!22368 0))(
  ( (tuple2!22369 (_1!12120 Unit!18617) (_2!12120 BitStream!11564)) )
))
(declare-fun lt!403343 () tuple2!22368)

(assert (=> b!261421 (= e!181877 (or (bvslt (currentByte!12641 (_2!12120 lt!403343)) #b00000000000000000000000000000000) (bvsge (currentByte!12641 (_2!12120 lt!403343)) (size!6321 (buf!6843 (_2!12120 lt!403343))))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18619 () Unit!18617)

(declare-fun Unit!18620 () Unit!18617)

(assert (=> b!261421 (= lt!403343 (ite b!187 (tuple2!22369 Unit!18619 (BitStream!11565 (array!14480 (store (arr!7308 (buf!6843 thiss!914)) (currentByte!12641 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7308 (buf!6843 thiss!914)) (currentByte!12641 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12636 thiss!914)))))) (size!6321 (buf!6843 thiss!914))) (currentByte!12641 thiss!914) (currentBit!12636 thiss!914))) (tuple2!22369 Unit!18620 (BitStream!11565 (array!14480 (store (arr!7308 (buf!6843 thiss!914)) (currentByte!12641 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7308 (buf!6843 thiss!914)) (currentByte!12641 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12636 thiss!914))))))) (size!6321 (buf!6843 thiss!914))) (currentByte!12641 thiss!914) (currentBit!12636 thiss!914)))))))

(declare-fun b!261422 () Bool)

(declare-fun array_inv!6062 (array!14479) Bool)

(assert (=> b!261422 (= e!181878 (array_inv!6062 (buf!6843 thiss!914)))))

(assert (= (and start!56870 res!218816) b!261421))

(assert (= start!56870 b!261422))

(declare-fun m!391217 () Bool)

(assert (=> start!56870 m!391217))

(declare-fun m!391219 () Bool)

(assert (=> start!56870 m!391219))

(declare-fun m!391221 () Bool)

(assert (=> b!261421 m!391221))

(declare-fun m!391223 () Bool)

(assert (=> b!261421 m!391223))

(declare-fun m!391225 () Bool)

(assert (=> b!261421 m!391225))

(declare-fun m!391227 () Bool)

(assert (=> b!261421 m!391227))

(declare-fun m!391229 () Bool)

(assert (=> b!261422 m!391229))

(push 1)

(assert (not b!261422))

(assert (not start!56870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88076 () Bool)

(assert (=> d!88076 (= (array_inv!6062 (buf!6843 thiss!914)) (bvsge (size!6321 (buf!6843 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261422 d!88076))

(declare-fun d!88078 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88078 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6321 (buf!6843 thiss!914))) ((_ sign_extend 32) (currentByte!12641 thiss!914)) ((_ sign_extend 32) (currentBit!12636 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6321 (buf!6843 thiss!914))) ((_ sign_extend 32) (currentByte!12641 thiss!914)) ((_ sign_extend 32) (currentBit!12636 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22327 () Bool)

(assert (= bs!22327 d!88078))

(declare-fun m!391239 () Bool)

(assert (=> bs!22327 m!391239))

(assert (=> start!56870 d!88078))

(declare-fun d!88080 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88080 (= (inv!12 thiss!914) (invariant!0 (currentBit!12636 thiss!914) (currentByte!12641 thiss!914) (size!6321 (buf!6843 thiss!914))))))

(declare-fun bs!22328 () Bool)

(assert (= bs!22328 d!88080))

(declare-fun m!391241 () Bool)

(assert (=> bs!22328 m!391241))

(assert (=> start!56870 d!88080))

(push 1)

(assert (not d!88078))

(assert (not d!88080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88090 () Bool)

(assert (=> d!88090 (= (remainingBits!0 ((_ sign_extend 32) (size!6321 (buf!6843 thiss!914))) ((_ sign_extend 32) (currentByte!12641 thiss!914)) ((_ sign_extend 32) (currentBit!12636 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6321 (buf!6843 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12641 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12636 thiss!914)))))))

(assert (=> d!88078 d!88090))

(declare-fun d!88092 () Bool)

(assert (=> d!88092 (= (invariant!0 (currentBit!12636 thiss!914) (currentByte!12641 thiss!914) (size!6321 (buf!6843 thiss!914))) (and (bvsge (currentBit!12636 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12636 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12641 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12641 thiss!914) (size!6321 (buf!6843 thiss!914))) (and (= (currentBit!12636 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12641 thiss!914) (size!6321 (buf!6843 thiss!914)))))))))

(assert (=> d!88080 d!88092))

(push 1)

(check-sat)


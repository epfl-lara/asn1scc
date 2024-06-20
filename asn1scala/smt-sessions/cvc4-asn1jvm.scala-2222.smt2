; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56360 () Bool)

(assert start!56360)

(declare-fun res!218218 () Bool)

(declare-fun e!181174 () Bool)

(assert (=> start!56360 (=> (not res!218218) (not e!181174))))

(declare-datatypes ((array!14347 0))(
  ( (array!14348 (arr!7260 (Array (_ BitVec 32) (_ BitVec 8))) (size!6273 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11468 0))(
  ( (BitStream!11469 (buf!6795 array!14347) (currentByte!12506 (_ BitVec 32)) (currentBit!12501 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11468)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56360 (= res!218218 (validate_offset_bit!0 ((_ sign_extend 32) (size!6273 (buf!6795 thiss!914))) ((_ sign_extend 32) (currentByte!12506 thiss!914)) ((_ sign_extend 32) (currentBit!12501 thiss!914))))))

(assert (=> start!56360 e!181174))

(declare-fun e!181177 () Bool)

(declare-fun inv!12 (BitStream!11468) Bool)

(assert (=> start!56360 (and (inv!12 thiss!914) e!181177)))

(assert (=> start!56360 true))

(declare-fun b!260682 () Bool)

(declare-fun e!181176 () Bool)

(assert (=> b!260682 (= e!181174 (not e!181176))))

(declare-fun res!218219 () Bool)

(assert (=> b!260682 (=> res!218219 e!181176)))

(declare-datatypes ((Unit!18545 0))(
  ( (Unit!18546) )
))
(declare-datatypes ((tuple2!22344 0))(
  ( (tuple2!22345 (_1!12108 Unit!18545) (_2!12108 BitStream!11468)) )
))
(declare-fun lt!402811 () tuple2!22344)

(declare-fun increaseBitIndex!0 (BitStream!11468) tuple2!22344)

(assert (=> b!260682 (= res!218219 (not (= (size!6273 (buf!6795 thiss!914)) (size!6273 (buf!6795 (_2!12108 (increaseBitIndex!0 (_2!12108 lt!402811))))))))))

(declare-fun arrayRangesEq!940 (array!14347 array!14347 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260682 (arrayRangesEq!940 (buf!6795 thiss!914) (array!14348 (store (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 (_2!12108 lt!402811)) (select (arr!7260 (buf!6795 (_2!12108 lt!402811))) (currentByte!12506 (_2!12108 lt!402811)))) (size!6273 (buf!6795 thiss!914))) #b00000000000000000000000000000000 (currentByte!12506 (_2!12108 lt!402811)))))

(declare-fun lt!402812 () Unit!18545)

(declare-fun arrayUpdatedAtPrefixLemma!456 (array!14347 (_ BitVec 32) (_ BitVec 8)) Unit!18545)

(assert (=> b!260682 (= lt!402812 (arrayUpdatedAtPrefixLemma!456 (buf!6795 thiss!914) (currentByte!12506 (_2!12108 lt!402811)) (select (arr!7260 (buf!6795 (_2!12108 lt!402811))) (currentByte!12506 (_2!12108 lt!402811)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18547 () Unit!18545)

(declare-fun Unit!18548 () Unit!18545)

(assert (=> b!260682 (= lt!402811 (ite b!187 (tuple2!22345 Unit!18547 (BitStream!11469 (array!14348 (store (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12501 thiss!914)))))) (size!6273 (buf!6795 thiss!914))) (currentByte!12506 thiss!914) (currentBit!12501 thiss!914))) (tuple2!22345 Unit!18548 (BitStream!11469 (array!14348 (store (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12501 thiss!914))))))) (size!6273 (buf!6795 thiss!914))) (currentByte!12506 thiss!914) (currentBit!12501 thiss!914)))))))

(declare-fun b!260683 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260683 (= e!181176 (invariant!0 (currentBit!12501 thiss!914) (currentByte!12506 thiss!914) (size!6273 (buf!6795 thiss!914))))))

(declare-fun b!260684 () Bool)

(declare-fun array_inv!6014 (array!14347) Bool)

(assert (=> b!260684 (= e!181177 (array_inv!6014 (buf!6795 thiss!914)))))

(assert (= (and start!56360 res!218218) b!260682))

(assert (= (and b!260682 (not res!218219)) b!260683))

(assert (= start!56360 b!260684))

(declare-fun m!390161 () Bool)

(assert (=> start!56360 m!390161))

(declare-fun m!390163 () Bool)

(assert (=> start!56360 m!390163))

(declare-fun m!390165 () Bool)

(assert (=> b!260682 m!390165))

(declare-fun m!390167 () Bool)

(assert (=> b!260682 m!390167))

(assert (=> b!260682 m!390165))

(declare-fun m!390169 () Bool)

(assert (=> b!260682 m!390169))

(declare-fun m!390171 () Bool)

(assert (=> b!260682 m!390171))

(declare-fun m!390173 () Bool)

(assert (=> b!260682 m!390173))

(declare-fun m!390175 () Bool)

(assert (=> b!260682 m!390175))

(declare-fun m!390177 () Bool)

(assert (=> b!260682 m!390177))

(declare-fun m!390179 () Bool)

(assert (=> b!260682 m!390179))

(declare-fun m!390181 () Bool)

(assert (=> b!260682 m!390181))

(declare-fun m!390183 () Bool)

(assert (=> b!260683 m!390183))

(declare-fun m!390185 () Bool)

(assert (=> b!260684 m!390185))

(push 1)

(assert (not start!56360))

(assert (not b!260682))

(assert (not b!260683))

(assert (not b!260684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87586 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87586 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6273 (buf!6795 thiss!914))) ((_ sign_extend 32) (currentByte!12506 thiss!914)) ((_ sign_extend 32) (currentBit!12501 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6273 (buf!6795 thiss!914))) ((_ sign_extend 32) (currentByte!12506 thiss!914)) ((_ sign_extend 32) (currentBit!12501 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22199 () Bool)

(assert (= bs!22199 d!87586))

(declare-fun m!390189 () Bool)

(assert (=> bs!22199 m!390189))

(assert (=> start!56360 d!87586))

(declare-fun d!87588 () Bool)

(assert (=> d!87588 (= (inv!12 thiss!914) (invariant!0 (currentBit!12501 thiss!914) (currentByte!12506 thiss!914) (size!6273 (buf!6795 thiss!914))))))

(declare-fun bs!22200 () Bool)

(assert (= bs!22200 d!87588))

(assert (=> bs!22200 m!390183))

(assert (=> start!56360 d!87588))

(declare-fun d!87590 () Bool)

(declare-fun e!181191 () Bool)

(assert (=> d!87590 e!181191))

(declare-fun res!218240 () Bool)

(assert (=> d!87590 (=> (not res!218240) (not e!181191))))

(declare-fun lt!402851 () tuple2!22344)

(declare-fun lt!402852 () (_ BitVec 64))

(declare-fun lt!402850 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!87590 (= res!218240 (= (bvadd lt!402850 lt!402852) (bitIndex!0 (size!6273 (buf!6795 (_2!12108 lt!402851))) (currentByte!12506 (_2!12108 lt!402851)) (currentBit!12501 (_2!12108 lt!402851)))))))

(assert (=> d!87590 (or (not (= (bvand lt!402850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402852 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402850 lt!402852) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87590 (= lt!402852 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!87590 (= lt!402850 (bitIndex!0 (size!6273 (buf!6795 (_2!12108 lt!402811))) (currentByte!12506 (_2!12108 lt!402811)) (currentBit!12501 (_2!12108 lt!402811))))))

(declare-fun Unit!18553 () Unit!18545)

(declare-fun Unit!18554 () Unit!18545)

(assert (=> d!87590 (= lt!402851 (ite (bvslt (currentBit!12501 (_2!12108 lt!402811)) #b00000000000000000000000000000111) (tuple2!22345 Unit!18553 (BitStream!11469 (buf!6795 (_2!12108 lt!402811)) (currentByte!12506 (_2!12108 lt!402811)) (bvadd (currentBit!12501 (_2!12108 lt!402811)) #b00000000000000000000000000000001))) (tuple2!22345 Unit!18554 (BitStream!11469 (buf!6795 (_2!12108 lt!402811)) (bvadd (currentByte!12506 (_2!12108 lt!402811)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!87590 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6273 (buf!6795 (_2!12108 lt!402811)))) ((_ sign_extend 32) (currentByte!12506 (_2!12108 lt!402811))) ((_ sign_extend 32) (currentBit!12501 (_2!12108 lt!402811)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!87590 (= (increaseBitIndex!0 (_2!12108 lt!402811)) lt!402851)))

(declare-fun b!260705 () Bool)

(declare-fun res!218241 () Bool)

(assert (=> b!260705 (=> (not res!218241) (not e!181191))))

(declare-fun lt!402848 () (_ BitVec 64))

(declare-fun lt!402849 () (_ BitVec 64))

(assert (=> b!260705 (= res!218241 (= (bvsub lt!402848 lt!402849) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!260705 (or (= (bvand lt!402848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402849 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402848 lt!402849) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260705 (= lt!402849 (remainingBits!0 ((_ sign_extend 32) (size!6273 (buf!6795 (_2!12108 lt!402851)))) ((_ sign_extend 32) (currentByte!12506 (_2!12108 lt!402851))) ((_ sign_extend 32) (currentBit!12501 (_2!12108 lt!402851)))))))

(assert (=> b!260705 (= lt!402848 (remainingBits!0 ((_ sign_extend 32) (size!6273 (buf!6795 (_2!12108 lt!402811)))) ((_ sign_extend 32) (currentByte!12506 (_2!12108 lt!402811))) ((_ sign_extend 32) (currentBit!12501 (_2!12108 lt!402811)))))))

(declare-fun b!260706 () Bool)

(assert (=> b!260706 (= e!181191 (= (size!6273 (buf!6795 (_2!12108 lt!402811))) (size!6273 (buf!6795 (_2!12108 lt!402851)))))))

(assert (= (and d!87590 res!218240) b!260705))

(assert (= (and b!260705 res!218241) b!260706))

(declare-fun m!390205 () Bool)

(assert (=> d!87590 m!390205))

(declare-fun m!390207 () Bool)

(assert (=> d!87590 m!390207))

(declare-fun m!390209 () Bool)

(assert (=> d!87590 m!390209))

(declare-fun m!390211 () Bool)

(assert (=> b!260705 m!390211))

(assert (=> b!260705 m!390209))

(assert (=> b!260682 d!87590))

(declare-fun d!87598 () Bool)

(declare-fun res!218255 () Bool)

(declare-fun e!181204 () Bool)

(assert (=> d!87598 (=> res!218255 e!181204)))

(assert (=> d!87598 (= res!218255 (= #b00000000000000000000000000000000 (currentByte!12506 (_2!12108 lt!402811))))))

(assert (=> d!87598 (= (arrayRangesEq!940 (buf!6795 thiss!914) (array!14348 (store (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 (_2!12108 lt!402811)) (select (arr!7260 (buf!6795 (_2!12108 lt!402811))) (currentByte!12506 (_2!12108 lt!402811)))) (size!6273 (buf!6795 thiss!914))) #b00000000000000000000000000000000 (currentByte!12506 (_2!12108 lt!402811))) e!181204)))

(declare-fun b!260720 () Bool)

(declare-fun e!181205 () Bool)

(assert (=> b!260720 (= e!181204 e!181205)))

(declare-fun res!218256 () Bool)

(assert (=> b!260720 (=> (not res!218256) (not e!181205))))

(assert (=> b!260720 (= res!218256 (= (select (arr!7260 (buf!6795 thiss!914)) #b00000000000000000000000000000000) (select (arr!7260 (array!14348 (store (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 (_2!12108 lt!402811)) (select (arr!7260 (buf!6795 (_2!12108 lt!402811))) (currentByte!12506 (_2!12108 lt!402811)))) (size!6273 (buf!6795 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!260721 () Bool)

(assert (=> b!260721 (= e!181205 (arrayRangesEq!940 (buf!6795 thiss!914) (array!14348 (store (arr!7260 (buf!6795 thiss!914)) (currentByte!12506 (_2!12108 lt!402811)) (select (arr!7260 (buf!6795 (_2!12108 lt!402811))) (currentByte!12506 (_2!12108 lt!402811)))) (size!6273 (buf!6795 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12506 (_2!12108 lt!402811))))))

(assert (= (and d!87598 (not res!218255)) b!260720))

(assert (= (and b!260720 res!218256) b!260721))

(declare-fun m!390223 () Bool)

(assert (=> b!260720 m!390223))

(declare-fun m!390225 () Bool)

(assert (=> b!260720 m!390225))

(declare-fun m!390227 () Bool)

(assert (=> b!260721 m!390227))

(assert (=> b!260682 d!87598))

(declare-fun d!87606 () Bool)

(declare-fun e!181212 () Bool)

(assert (=> d!87606 e!181212))

(declare-fun res!218263 () Bool)

(assert (=> d!87606 (=> (not res!218263) (not e!181212))))

(assert (=> d!87606 (= res!218263 (and (bvsge (currentByte!12506 (_2!12108 lt!402811)) #b00000000000000000000000000000000) (bvslt (currentByte!12506 (_2!12108 lt!402811)) (size!6273 (buf!6795 thiss!914)))))))

(declare-fun lt!402865 () Unit!18545)

(declare-fun choose!350 (array!14347 (_ BitVec 32) (_ BitVec 8)) Unit!18545)


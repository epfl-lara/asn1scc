; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42768 () Bool)

(assert start!42768)

(declare-fun b!201541 () Bool)

(declare-fun res!168739 () Bool)

(declare-fun e!138220 () Bool)

(assert (=> b!201541 (=> (not res!168739) (not e!138220))))

(declare-datatypes ((array!10244 0))(
  ( (array!10245 (arr!5440 (Array (_ BitVec 32) (_ BitVec 8))) (size!4510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8128 0))(
  ( (BitStream!8129 (buf!5015 array!10244) (currentByte!9428 (_ BitVec 32)) (currentBit!9423 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8128)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201541 (= res!168739 (invariant!0 (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204) (size!4510 (buf!5015 thiss!1204))))))

(declare-fun b!201542 () Bool)

(declare-fun e!138225 () Bool)

(declare-fun array_inv!4251 (array!10244) Bool)

(assert (=> b!201542 (= e!138225 (array_inv!4251 (buf!5015 thiss!1204)))))

(declare-fun b!201543 () Bool)

(declare-fun res!168736 () Bool)

(assert (=> b!201543 (=> (not res!168736) (not e!138220))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201543 (= res!168736 (validate_offset_bits!1 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))) ((_ sign_extend 32) (currentByte!9428 thiss!1204)) ((_ sign_extend 32) (currentBit!9423 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201544 () Bool)

(declare-fun e!138221 () Bool)

(declare-datatypes ((tuple2!17228 0))(
  ( (tuple2!17229 (_1!9266 BitStream!8128) (_2!9266 Bool)) )
))
(declare-fun lt!314372 () tuple2!17228)

(declare-fun lt!314367 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201544 (= e!138221 (= (bitIndex!0 (size!4510 (buf!5015 (_1!9266 lt!314372))) (currentByte!9428 (_1!9266 lt!314372)) (currentBit!9423 (_1!9266 lt!314372))) lt!314367))))

(declare-fun b!201545 () Bool)

(declare-fun e!138222 () Bool)

(assert (=> b!201545 (= e!138222 e!138221)))

(declare-fun res!168734 () Bool)

(assert (=> b!201545 (=> (not res!168734) (not e!138221))))

(declare-fun lt!314370 () Bool)

(declare-datatypes ((Unit!14313 0))(
  ( (Unit!14314) )
))
(declare-datatypes ((tuple2!17230 0))(
  ( (tuple2!17231 (_1!9267 Unit!14313) (_2!9267 BitStream!8128)) )
))
(declare-fun lt!314366 () tuple2!17230)

(assert (=> b!201545 (= res!168734 (and (= (_2!9266 lt!314372) lt!314370) (= (_1!9266 lt!314372) (_2!9267 lt!314366))))))

(declare-fun readBitPure!0 (BitStream!8128) tuple2!17228)

(declare-fun readerFrom!0 (BitStream!8128 (_ BitVec 32) (_ BitVec 32)) BitStream!8128)

(assert (=> b!201545 (= lt!314372 (readBitPure!0 (readerFrom!0 (_2!9267 lt!314366) (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204))))))

(declare-fun b!201546 () Bool)

(declare-fun lt!314368 () (_ BitVec 64))

(declare-fun lt!314371 () (_ BitVec 64))

(assert (=> b!201546 (= e!138220 (not (or (not (= lt!314368 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!314368 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314371) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!201546 (= lt!314368 (bvand lt!314371 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!201546 (= lt!314371 (bitIndex!0 (size!4510 (buf!5015 thiss!1204)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204)))))

(declare-fun e!138224 () Bool)

(assert (=> b!201546 e!138224))

(declare-fun res!168733 () Bool)

(assert (=> b!201546 (=> (not res!168733) (not e!138224))))

(assert (=> b!201546 (= res!168733 (= (size!4510 (buf!5015 thiss!1204)) (size!4510 (buf!5015 (_2!9267 lt!314366)))))))

(declare-fun appendBit!0 (BitStream!8128 Bool) tuple2!17230)

(assert (=> b!201546 (= lt!314366 (appendBit!0 thiss!1204 lt!314370))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!201546 (= lt!314370 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201547 () Bool)

(declare-fun res!168740 () Bool)

(assert (=> b!201547 (=> (not res!168740) (not e!138222))))

(declare-fun isPrefixOf!0 (BitStream!8128 BitStream!8128) Bool)

(assert (=> b!201547 (= res!168740 (isPrefixOf!0 thiss!1204 (_2!9267 lt!314366)))))

(declare-fun b!201548 () Bool)

(assert (=> b!201548 (= e!138224 e!138222)))

(declare-fun res!168738 () Bool)

(assert (=> b!201548 (=> (not res!168738) (not e!138222))))

(declare-fun lt!314369 () (_ BitVec 64))

(assert (=> b!201548 (= res!168738 (= lt!314367 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314369)))))

(assert (=> b!201548 (= lt!314367 (bitIndex!0 (size!4510 (buf!5015 (_2!9267 lt!314366))) (currentByte!9428 (_2!9267 lt!314366)) (currentBit!9423 (_2!9267 lt!314366))))))

(assert (=> b!201548 (= lt!314369 (bitIndex!0 (size!4510 (buf!5015 thiss!1204)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204)))))

(declare-fun res!168737 () Bool)

(assert (=> start!42768 (=> (not res!168737) (not e!138220))))

(assert (=> start!42768 (= res!168737 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42768 e!138220))

(assert (=> start!42768 true))

(declare-fun inv!12 (BitStream!8128) Bool)

(assert (=> start!42768 (and (inv!12 thiss!1204) e!138225)))

(declare-fun b!201549 () Bool)

(declare-fun res!168735 () Bool)

(assert (=> b!201549 (=> (not res!168735) (not e!138220))))

(assert (=> b!201549 (= res!168735 (not (= i!590 nBits!348)))))

(assert (= (and start!42768 res!168737) b!201543))

(assert (= (and b!201543 res!168736) b!201541))

(assert (= (and b!201541 res!168739) b!201549))

(assert (= (and b!201549 res!168735) b!201546))

(assert (= (and b!201546 res!168733) b!201548))

(assert (= (and b!201548 res!168738) b!201547))

(assert (= (and b!201547 res!168740) b!201545))

(assert (= (and b!201545 res!168734) b!201544))

(assert (= start!42768 b!201542))

(declare-fun m!312123 () Bool)

(assert (=> b!201542 m!312123))

(declare-fun m!312125 () Bool)

(assert (=> start!42768 m!312125))

(declare-fun m!312127 () Bool)

(assert (=> b!201543 m!312127))

(declare-fun m!312129 () Bool)

(assert (=> b!201547 m!312129))

(declare-fun m!312131 () Bool)

(assert (=> b!201541 m!312131))

(declare-fun m!312133 () Bool)

(assert (=> b!201546 m!312133))

(declare-fun m!312135 () Bool)

(assert (=> b!201546 m!312135))

(declare-fun m!312137 () Bool)

(assert (=> b!201548 m!312137))

(assert (=> b!201548 m!312133))

(declare-fun m!312139 () Bool)

(assert (=> b!201544 m!312139))

(declare-fun m!312141 () Bool)

(assert (=> b!201545 m!312141))

(assert (=> b!201545 m!312141))

(declare-fun m!312143 () Bool)

(assert (=> b!201545 m!312143))

(push 1)

(assert (not b!201545))

(assert (not b!201546))

(assert (not b!201544))

(assert (not b!201542))

(assert (not b!201547))

(assert (not start!42768))

(assert (not b!201548))

(assert (not b!201543))

(assert (not b!201541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69073 () Bool)

(assert (=> d!69073 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204) (size!4510 (buf!5015 thiss!1204))))))

(declare-fun bs!17049 () Bool)

(assert (= bs!17049 d!69073))

(assert (=> bs!17049 m!312131))

(assert (=> start!42768 d!69073))

(declare-fun d!69075 () Bool)

(declare-fun e!138275 () Bool)

(assert (=> d!69075 e!138275))

(declare-fun res!168813 () Bool)

(assert (=> d!69075 (=> (not res!168813) (not e!138275))))

(declare-fun lt!314453 () (_ BitVec 64))

(declare-fun lt!314452 () (_ BitVec 64))

(declare-fun lt!314454 () (_ BitVec 64))

(assert (=> d!69075 (= res!168813 (= lt!314453 (bvsub lt!314454 lt!314452)))))

(assert (=> d!69075 (or (= (bvand lt!314454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314454 lt!314452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69075 (= lt!314452 (remainingBits!0 ((_ sign_extend 32) (size!4510 (buf!5015 (_1!9266 lt!314372)))) ((_ sign_extend 32) (currentByte!9428 (_1!9266 lt!314372))) ((_ sign_extend 32) (currentBit!9423 (_1!9266 lt!314372)))))))

(declare-fun lt!314455 () (_ BitVec 64))

(declare-fun lt!314456 () (_ BitVec 64))

(assert (=> d!69075 (= lt!314454 (bvmul lt!314455 lt!314456))))

(assert (=> d!69075 (or (= lt!314455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314456 (bvsdiv (bvmul lt!314455 lt!314456) lt!314455)))))

(assert (=> d!69075 (= lt!314456 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69075 (= lt!314455 ((_ sign_extend 32) (size!4510 (buf!5015 (_1!9266 lt!314372)))))))

(assert (=> d!69075 (= lt!314453 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9428 (_1!9266 lt!314372))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9423 (_1!9266 lt!314372)))))))

(assert (=> d!69075 (invariant!0 (currentBit!9423 (_1!9266 lt!314372)) (currentByte!9428 (_1!9266 lt!314372)) (size!4510 (buf!5015 (_1!9266 lt!314372))))))

(assert (=> d!69075 (= (bitIndex!0 (size!4510 (buf!5015 (_1!9266 lt!314372))) (currentByte!9428 (_1!9266 lt!314372)) (currentBit!9423 (_1!9266 lt!314372))) lt!314453)))

(declare-fun b!201625 () Bool)

(declare-fun res!168812 () Bool)

(assert (=> b!201625 (=> (not res!168812) (not e!138275))))

(assert (=> b!201625 (= res!168812 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314453))))

(declare-fun b!201626 () Bool)

(declare-fun lt!314451 () (_ BitVec 64))

(assert (=> b!201626 (= e!138275 (bvsle lt!314453 (bvmul lt!314451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201626 (or (= lt!314451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314451)))))

(assert (=> b!201626 (= lt!314451 ((_ sign_extend 32) (size!4510 (buf!5015 (_1!9266 lt!314372)))))))

(assert (= (and d!69075 res!168813) b!201625))

(assert (= (and b!201625 res!168812) b!201626))

(declare-fun m!312201 () Bool)

(assert (=> d!69075 m!312201))

(declare-fun m!312205 () Bool)

(assert (=> d!69075 m!312205))

(assert (=> b!201544 d!69075))

(declare-fun d!69087 () Bool)

(assert (=> d!69087 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))) ((_ sign_extend 32) (currentByte!9428 thiss!1204)) ((_ sign_extend 32) (currentBit!9423 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))) ((_ sign_extend 32) (currentByte!9428 thiss!1204)) ((_ sign_extend 32) (currentBit!9423 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17052 () Bool)

(assert (= bs!17052 d!69087))

(declare-fun m!312207 () Bool)

(assert (=> bs!17052 m!312207))

(assert (=> b!201543 d!69087))

(declare-fun d!69091 () Bool)

(declare-fun e!138280 () Bool)

(assert (=> d!69091 e!138280))

(declare-fun res!168819 () Bool)

(assert (=> d!69091 (=> (not res!168819) (not e!138280))))

(declare-fun lt!314459 () (_ BitVec 64))

(declare-fun lt!314460 () (_ BitVec 64))

(declare-fun lt!314458 () (_ BitVec 64))

(assert (=> d!69091 (= res!168819 (= lt!314459 (bvsub lt!314460 lt!314458)))))

(assert (=> d!69091 (or (= (bvand lt!314460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314460 lt!314458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69091 (= lt!314458 (remainingBits!0 ((_ sign_extend 32) (size!4510 (buf!5015 (_2!9267 lt!314366)))) ((_ sign_extend 32) (currentByte!9428 (_2!9267 lt!314366))) ((_ sign_extend 32) (currentBit!9423 (_2!9267 lt!314366)))))))

(declare-fun lt!314461 () (_ BitVec 64))

(declare-fun lt!314462 () (_ BitVec 64))

(assert (=> d!69091 (= lt!314460 (bvmul lt!314461 lt!314462))))

(assert (=> d!69091 (or (= lt!314461 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314462 (bvsdiv (bvmul lt!314461 lt!314462) lt!314461)))))

(assert (=> d!69091 (= lt!314462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69091 (= lt!314461 ((_ sign_extend 32) (size!4510 (buf!5015 (_2!9267 lt!314366)))))))

(assert (=> d!69091 (= lt!314459 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9428 (_2!9267 lt!314366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9423 (_2!9267 lt!314366)))))))

(assert (=> d!69091 (invariant!0 (currentBit!9423 (_2!9267 lt!314366)) (currentByte!9428 (_2!9267 lt!314366)) (size!4510 (buf!5015 (_2!9267 lt!314366))))))

(assert (=> d!69091 (= (bitIndex!0 (size!4510 (buf!5015 (_2!9267 lt!314366))) (currentByte!9428 (_2!9267 lt!314366)) (currentBit!9423 (_2!9267 lt!314366))) lt!314459)))

(declare-fun b!201631 () Bool)

(declare-fun res!168818 () Bool)

(assert (=> b!201631 (=> (not res!168818) (not e!138280))))

(assert (=> b!201631 (= res!168818 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314459))))

(declare-fun b!201632 () Bool)

(declare-fun lt!314457 () (_ BitVec 64))

(assert (=> b!201632 (= e!138280 (bvsle lt!314459 (bvmul lt!314457 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201632 (or (= lt!314457 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314457 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314457)))))

(assert (=> b!201632 (= lt!314457 ((_ sign_extend 32) (size!4510 (buf!5015 (_2!9267 lt!314366)))))))

(assert (= (and d!69091 res!168819) b!201631))

(assert (= (and b!201631 res!168818) b!201632))

(declare-fun m!312213 () Bool)

(assert (=> d!69091 m!312213))

(declare-fun m!312215 () Bool)

(assert (=> d!69091 m!312215))

(assert (=> b!201548 d!69091))

(declare-fun d!69095 () Bool)

(declare-fun e!138281 () Bool)

(assert (=> d!69095 e!138281))

(declare-fun res!168821 () Bool)

(assert (=> d!69095 (=> (not res!168821) (not e!138281))))

(declare-fun lt!314464 () (_ BitVec 64))

(declare-fun lt!314465 () (_ BitVec 64))

(declare-fun lt!314466 () (_ BitVec 64))

(assert (=> d!69095 (= res!168821 (= lt!314465 (bvsub lt!314466 lt!314464)))))

(assert (=> d!69095 (or (= (bvand lt!314466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314466 lt!314464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69095 (= lt!314464 (remainingBits!0 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))) ((_ sign_extend 32) (currentByte!9428 thiss!1204)) ((_ sign_extend 32) (currentBit!9423 thiss!1204))))))

(declare-fun lt!314467 () (_ BitVec 64))

(declare-fun lt!314468 () (_ BitVec 64))

(assert (=> d!69095 (= lt!314466 (bvmul lt!314467 lt!314468))))

(assert (=> d!69095 (or (= lt!314467 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314468 (bvsdiv (bvmul lt!314467 lt!314468) lt!314467)))))

(assert (=> d!69095 (= lt!314468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69095 (= lt!314467 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))))))

(assert (=> d!69095 (= lt!314465 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9428 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9423 thiss!1204))))))

(assert (=> d!69095 (invariant!0 (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204) (size!4510 (buf!5015 thiss!1204)))))

(assert (=> d!69095 (= (bitIndex!0 (size!4510 (buf!5015 thiss!1204)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204)) lt!314465)))

(declare-fun b!201633 () Bool)

(declare-fun res!168820 () Bool)

(assert (=> b!201633 (=> (not res!168820) (not e!138281))))

(assert (=> b!201633 (= res!168820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314465))))

(declare-fun b!201634 () Bool)

(declare-fun lt!314463 () (_ BitVec 64))

(assert (=> b!201634 (= e!138281 (bvsle lt!314465 (bvmul lt!314463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201634 (or (= lt!314463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314463)))))

(assert (=> b!201634 (= lt!314463 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))))))

(assert (= (and d!69095 res!168821) b!201633))

(assert (= (and b!201633 res!168820) b!201634))

(assert (=> d!69095 m!312207))

(assert (=> d!69095 m!312131))

(assert (=> b!201548 d!69095))

(declare-fun d!69097 () Bool)

(assert (=> d!69097 (= (array_inv!4251 (buf!5015 thiss!1204)) (bvsge (size!4510 (buf!5015 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201542 d!69097))

(declare-fun d!69101 () Bool)

(declare-fun res!168839 () Bool)

(declare-fun e!138293 () Bool)

(assert (=> d!69101 (=> (not res!168839) (not e!138293))))

(assert (=> d!69101 (= res!168839 (= (size!4510 (buf!5015 thiss!1204)) (size!4510 (buf!5015 (_2!9267 lt!314366)))))))

(assert (=> d!69101 (= (isPrefixOf!0 thiss!1204 (_2!9267 lt!314366)) e!138293)))

(declare-fun b!201652 () Bool)

(declare-fun res!168841 () Bool)

(assert (=> b!201652 (=> (not res!168841) (not e!138293))))

(assert (=> b!201652 (= res!168841 (bvsle (bitIndex!0 (size!4510 (buf!5015 thiss!1204)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204)) (bitIndex!0 (size!4510 (buf!5015 (_2!9267 lt!314366))) (currentByte!9428 (_2!9267 lt!314366)) (currentBit!9423 (_2!9267 lt!314366)))))))

(declare-fun b!201653 () Bool)

(declare-fun e!138294 () Bool)

(assert (=> b!201653 (= e!138293 e!138294)))

(declare-fun res!168840 () Bool)

(assert (=> b!201653 (=> res!168840 e!138294)))

(assert (=> b!201653 (= res!168840 (= (size!4510 (buf!5015 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201654 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10244 array!10244 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201654 (= e!138294 (arrayBitRangesEq!0 (buf!5015 thiss!1204) (buf!5015 (_2!9267 lt!314366)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4510 (buf!5015 thiss!1204)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204))))))

(assert (= (and d!69101 res!168839) b!201652))

(assert (= (and b!201652 res!168841) b!201653))

(assert (= (and b!201653 (not res!168840)) b!201654))

(assert (=> b!201652 m!312133))

(assert (=> b!201652 m!312137))

(assert (=> b!201654 m!312133))

(assert (=> b!201654 m!312133))

(declare-fun m!312221 () Bool)

(assert (=> b!201654 m!312221))

(assert (=> b!201547 d!69101))

(declare-fun d!69109 () Bool)

(assert (=> d!69109 (= (invariant!0 (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204) (size!4510 (buf!5015 thiss!1204))) (and (bvsge (currentBit!9423 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9423 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9428 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9428 thiss!1204) (size!4510 (buf!5015 thiss!1204))) (and (= (currentBit!9423 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9428 thiss!1204) (size!4510 (buf!5015 thiss!1204)))))))))

(assert (=> b!201541 d!69109))

(assert (=> b!201546 d!69095))

(declare-fun b!201690 () Bool)

(declare-fun res!168877 () Bool)

(declare-fun e!138311 () Bool)

(assert (=> b!201690 (=> (not res!168877) (not e!138311))))

(declare-fun lt!314532 () tuple2!17230)

(assert (=> b!201690 (= res!168877 (isPrefixOf!0 thiss!1204 (_2!9267 lt!314532)))))

(declare-fun b!201692 () Bool)

(declare-fun e!138312 () Bool)

(declare-fun lt!314531 () tuple2!17228)

(assert (=> b!201692 (= e!138312 (= (bitIndex!0 (size!4510 (buf!5015 (_1!9266 lt!314531))) (currentByte!9428 (_1!9266 lt!314531)) (currentBit!9423 (_1!9266 lt!314531))) (bitIndex!0 (size!4510 (buf!5015 (_2!9267 lt!314532))) (currentByte!9428 (_2!9267 lt!314532)) (currentBit!9423 (_2!9267 lt!314532)))))))

(declare-fun b!201689 () Bool)

(declare-fun res!168875 () Bool)

(assert (=> b!201689 (=> (not res!168875) (not e!138311))))

(declare-fun lt!314534 () (_ BitVec 64))

(declare-fun lt!314533 () (_ BitVec 64))

(assert (=> b!201689 (= res!168875 (= (bitIndex!0 (size!4510 (buf!5015 (_2!9267 lt!314532))) (currentByte!9428 (_2!9267 lt!314532)) (currentBit!9423 (_2!9267 lt!314532))) (bvadd lt!314534 lt!314533)))))

(assert (=> b!201689 (or (not (= (bvand lt!314534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314533 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314534 lt!314533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201689 (= lt!314533 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!201689 (= lt!314534 (bitIndex!0 (size!4510 (buf!5015 thiss!1204)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204)))))

(declare-fun b!201691 () Bool)

(assert (=> b!201691 (= e!138311 e!138312)))

(declare-fun res!168876 () Bool)

(assert (=> b!201691 (=> (not res!168876) (not e!138312))))

(assert (=> b!201691 (= res!168876 (and (= (_2!9266 lt!314531) lt!314370) (= (_1!9266 lt!314531) (_2!9267 lt!314532))))))

(assert (=> b!201691 (= lt!314531 (readBitPure!0 (readerFrom!0 (_2!9267 lt!314532) (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204))))))

(declare-fun d!69111 () Bool)

(assert (=> d!69111 e!138311))

(declare-fun res!168874 () Bool)

(assert (=> d!69111 (=> (not res!168874) (not e!138311))))

(assert (=> d!69111 (= res!168874 (= (size!4510 (buf!5015 thiss!1204)) (size!4510 (buf!5015 (_2!9267 lt!314532)))))))

(declare-fun choose!16 (BitStream!8128 Bool) tuple2!17230)

(assert (=> d!69111 (= lt!314532 (choose!16 thiss!1204 lt!314370))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69111 (validate_offset_bit!0 ((_ sign_extend 32) (size!4510 (buf!5015 thiss!1204))) ((_ sign_extend 32) (currentByte!9428 thiss!1204)) ((_ sign_extend 32) (currentBit!9423 thiss!1204)))))

(assert (=> d!69111 (= (appendBit!0 thiss!1204 lt!314370) lt!314532)))

(assert (= (and d!69111 res!168874) b!201689))

(assert (= (and b!201689 res!168875) b!201690))

(assert (= (and b!201690 res!168877) b!201691))

(assert (= (and b!201691 res!168876) b!201692))

(declare-fun m!312247 () Bool)

(assert (=> d!69111 m!312247))

(declare-fun m!312249 () Bool)

(assert (=> d!69111 m!312249))

(declare-fun m!312251 () Bool)

(assert (=> b!201690 m!312251))

(declare-fun m!312253 () Bool)

(assert (=> b!201691 m!312253))

(assert (=> b!201691 m!312253))

(declare-fun m!312255 () Bool)

(assert (=> b!201691 m!312255))

(declare-fun m!312257 () Bool)

(assert (=> b!201689 m!312257))

(assert (=> b!201689 m!312133))

(declare-fun m!312259 () Bool)

(assert (=> b!201692 m!312259))

(assert (=> b!201692 m!312257))

(assert (=> b!201546 d!69111))

(declare-fun d!69129 () Bool)

(declare-datatypes ((tuple2!17244 0))(
  ( (tuple2!17245 (_1!9274 Bool) (_2!9274 BitStream!8128)) )
))
(declare-fun lt!314537 () tuple2!17244)

(declare-fun readBit!0 (BitStream!8128) tuple2!17244)

(assert (=> d!69129 (= lt!314537 (readBit!0 (readerFrom!0 (_2!9267 lt!314366) (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204))))))

(assert (=> d!69129 (= (readBitPure!0 (readerFrom!0 (_2!9267 lt!314366) (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204))) (tuple2!17229 (_2!9274 lt!314537) (_1!9274 lt!314537)))))

(declare-fun bs!17057 () Bool)

(assert (= bs!17057 d!69129))

(assert (=> bs!17057 m!312141))

(declare-fun m!312261 () Bool)

(assert (=> bs!17057 m!312261))

(assert (=> b!201545 d!69129))

(declare-fun d!69131 () Bool)

(declare-fun e!138315 () Bool)

(assert (=> d!69131 e!138315))

(declare-fun res!168881 () Bool)

(assert (=> d!69131 (=> (not res!168881) (not e!138315))))

(assert (=> d!69131 (= res!168881 (invariant!0 (currentBit!9423 (_2!9267 lt!314366)) (currentByte!9428 (_2!9267 lt!314366)) (size!4510 (buf!5015 (_2!9267 lt!314366)))))))

(assert (=> d!69131 (= (readerFrom!0 (_2!9267 lt!314366) (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204)) (BitStream!8129 (buf!5015 (_2!9267 lt!314366)) (currentByte!9428 thiss!1204) (currentBit!9423 thiss!1204)))))

(declare-fun b!201695 () Bool)

(assert (=> b!201695 (= e!138315 (invariant!0 (currentBit!9423 thiss!1204) (currentByte!9428 thiss!1204) (size!4510 (buf!5015 (_2!9267 lt!314366)))))))

(assert (= (and d!69131 res!168881) b!201695))

(assert (=> d!69131 m!312215))

(declare-fun m!312263 () Bool)

(assert (=> b!201695 m!312263))

(assert (=> b!201545 d!69131))

(push 1)

(assert (not b!201692))

(assert (not b!201654))

(assert (not b!201689))

(assert (not b!201691))

(assert (not d!69131))

(assert (not d!69095))

(assert (not d!69111))

(assert (not d!69129))

(assert (not d!69091))

(assert (not b!201652))

(assert (not b!201695))

(assert (not d!69075))

(assert (not d!69087))

(assert (not d!69073))

(assert (not b!201690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


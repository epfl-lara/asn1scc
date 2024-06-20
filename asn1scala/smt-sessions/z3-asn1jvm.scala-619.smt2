; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17544 () Bool)

(assert start!17544)

(declare-fun b!84509 () Bool)

(declare-fun e!56458 () Bool)

(declare-datatypes ((array!4013 0))(
  ( (array!4014 (arr!2452 (Array (_ BitVec 32) (_ BitVec 8))) (size!1815 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3192 0))(
  ( (BitStream!3193 (buf!2205 array!4013) (currentByte!4375 (_ BitVec 32)) (currentBit!4370 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3192)

(declare-fun array_inv!1661 (array!4013) Bool)

(assert (=> b!84509 (= e!56458 (array_inv!1661 (buf!2205 thiss!1136)))))

(declare-fun b!84510 () Bool)

(declare-datatypes ((Unit!5665 0))(
  ( (Unit!5666) )
))
(declare-datatypes ((tuple3!372 0))(
  ( (tuple3!373 (_1!3830 Unit!5665) (_2!3830 BitStream!3192) (_3!210 (_ BitVec 32))) )
))
(declare-fun e!56457 () tuple3!372)

(declare-fun Unit!5667 () Unit!5665)

(assert (=> b!84510 (= e!56457 (tuple3!373 Unit!5667 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84511 () Bool)

(declare-fun res!69341 () Bool)

(declare-fun e!56460 () Bool)

(assert (=> b!84511 (=> (not res!69341) (not e!56460))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84511 (= res!69341 (validate_offset_bits!1 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))) ((_ sign_extend 32) (currentByte!4375 thiss!1136)) ((_ sign_extend 32) (currentBit!4370 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun b!84512 () Bool)

(declare-fun res!69340 () Bool)

(assert (=> b!84512 (=> (not res!69340) (not e!56460))))

(assert (=> b!84512 (= res!69340 (= (size!1815 (buf!2205 (_2!3830 e!56457))) (size!1815 (buf!2205 thiss!1136))))))

(declare-fun c!5819 () Bool)

(assert (=> b!84512 (= c!5819 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun lt!134271 () (_ BitVec 64))

(declare-fun lt!134270 () (_ BitVec 64))

(declare-fun b!84508 () Bool)

(assert (=> b!84508 (= e!56460 (and (= lt!134271 (bvand ((_ sign_extend 32) nBits!333) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!134271 (bvand (bvadd lt!134270 ((_ sign_extend 32) nBits!333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!84508 (= lt!134271 (bvand lt!134270 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84508 (= lt!134270 (bitIndex!0 (size!1815 (buf!2205 thiss!1136)) (currentByte!4375 thiss!1136) (currentBit!4370 thiss!1136)))))

(declare-fun res!69343 () Bool)

(assert (=> start!17544 (=> (not res!69343) (not e!56460))))

(assert (=> start!17544 (= res!69343 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17544 e!56460))

(assert (=> start!17544 true))

(declare-fun inv!12 (BitStream!3192) Bool)

(assert (=> start!17544 (and (inv!12 thiss!1136) e!56458)))

(declare-fun b!84513 () Bool)

(declare-fun res!69342 () Bool)

(assert (=> b!84513 (=> (not res!69342) (not e!56460))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84513 (= res!69342 (invariant!0 (currentBit!4370 thiss!1136) (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136))))))

(declare-fun v!176 () (_ BitVec 64))

(declare-fun b!84514 () Bool)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3192 (_ BitVec 64) BitStream!3192 (_ BitVec 32)) tuple3!372)

(assert (=> b!84514 (= e!56457 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(assert (= (and start!17544 res!69343) b!84511))

(assert (= (and b!84511 res!69341) b!84513))

(assert (= (and b!84513 res!69342) b!84512))

(assert (= (and b!84512 c!5819) b!84514))

(assert (= (and b!84512 (not c!5819)) b!84510))

(assert (= (and b!84512 res!69340) b!84508))

(assert (= start!17544 b!84509))

(declare-fun m!131063 () Bool)

(assert (=> start!17544 m!131063))

(declare-fun m!131065 () Bool)

(assert (=> b!84514 m!131065))

(declare-fun m!131067 () Bool)

(assert (=> b!84511 m!131067))

(declare-fun m!131069 () Bool)

(assert (=> b!84509 m!131069))

(declare-fun m!131071 () Bool)

(assert (=> b!84513 m!131071))

(declare-fun m!131073 () Bool)

(assert (=> b!84508 m!131073))

(check-sat (not b!84514) (not b!84511) (not start!17544) (not b!84509) (not b!84513) (not b!84508))
(check-sat)
(get-model)

(declare-fun b!84622 () Bool)

(declare-fun res!69441 () Bool)

(declare-fun e!56502 () Bool)

(assert (=> b!84622 (=> (not res!69441) (not e!56502))))

(declare-fun lt!134342 () (_ BitVec 64))

(declare-fun lt!134343 () (_ BitVec 64))

(declare-fun lt!134341 () tuple3!372)

(assert (=> b!84622 (= res!69441 (= (bitIndex!0 (size!1815 (buf!2205 (_2!3830 lt!134341))) (currentByte!4375 (_2!3830 lt!134341)) (currentBit!4370 (_2!3830 lt!134341))) (bvadd lt!134343 lt!134342)))))

(assert (=> b!84622 (or (not (= (bvand lt!134343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134342 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134343 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134343 lt!134342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84622 (= lt!134342 ((_ sign_extend 32) (_3!210 lt!134341)))))

(assert (=> b!84622 (= lt!134343 (bitIndex!0 (size!1815 (buf!2205 thiss!1136)) (currentByte!4375 thiss!1136) (currentBit!4370 thiss!1136)))))

(declare-fun b!84623 () Bool)

(declare-fun res!69444 () Bool)

(declare-fun e!56503 () Bool)

(assert (=> b!84623 (=> (not res!69444) (not e!56503))))

(assert (=> b!84623 (= res!69444 (validate_offset_bits!1 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))) ((_ sign_extend 32) (currentByte!4375 thiss!1136)) ((_ sign_extend 32) (currentBit!4370 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84624 () Bool)

(assert (=> b!84624 (= e!56503 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun lt!134336 () (_ BitVec 32))

(declare-fun b!84625 () Bool)

(declare-datatypes ((tuple2!7244 0))(
  ( (tuple2!7245 (_1!3834 Unit!5665) (_2!3834 BitStream!3192)) )
))
(declare-fun lt!134338 () tuple2!7244)

(declare-fun e!56501 () tuple3!372)

(assert (=> b!84625 (= e!56501 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3834 lt!134338) lt!134336))))

(declare-fun b!84627 () Bool)

(declare-fun res!69438 () Bool)

(declare-fun e!56504 () Bool)

(assert (=> b!84627 (=> (not res!69438) (not e!56504))))

(declare-fun lt!134337 () tuple2!7244)

(assert (=> b!84627 (= res!69438 (= (bitIndex!0 (size!1815 (buf!2205 (_2!3834 lt!134337))) (currentByte!4375 (_2!3834 lt!134337)) (currentBit!4370 (_2!3834 lt!134337))) (bvadd (bitIndex!0 (size!1815 (buf!2205 thiss!1136)) (currentByte!4375 thiss!1136) (currentBit!4370 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84628 () Bool)

(declare-fun e!56505 () Bool)

(assert (=> b!84628 (= e!56504 e!56505)))

(declare-fun res!69442 () Bool)

(assert (=> b!84628 (=> (not res!69442) (not e!56505))))

(declare-fun lt!134339 () Bool)

(declare-datatypes ((tuple2!7246 0))(
  ( (tuple2!7247 (_1!3835 BitStream!3192) (_2!3835 Bool)) )
))
(declare-fun lt!134340 () tuple2!7246)

(assert (=> b!84628 (= res!69442 (and (= (_2!3835 lt!134340) lt!134339) (= (_1!3835 lt!134340) (_2!3834 lt!134337))))))

(declare-fun readBitPure!0 (BitStream!3192) tuple2!7246)

(declare-fun readerFrom!0 (BitStream!3192 (_ BitVec 32) (_ BitVec 32)) BitStream!3192)

(assert (=> b!84628 (= lt!134340 (readBitPure!0 (readerFrom!0 (_2!3834 lt!134337) (currentBit!4370 thiss!1136) (currentByte!4375 thiss!1136))))))

(declare-fun b!84629 () Bool)

(assert (=> b!84629 (= e!56502 (bvsge (_3!210 lt!134341) nBits!333))))

(declare-fun b!84630 () Bool)

(assert (=> b!84630 (= e!56505 (= (bitIndex!0 (size!1815 (buf!2205 (_1!3835 lt!134340))) (currentByte!4375 (_1!3835 lt!134340)) (currentBit!4370 (_1!3835 lt!134340))) (bitIndex!0 (size!1815 (buf!2205 (_2!3834 lt!134337))) (currentByte!4375 (_2!3834 lt!134337)) (currentBit!4370 (_2!3834 lt!134337)))))))

(declare-fun b!84631 () Bool)

(declare-fun res!69443 () Bool)

(assert (=> b!84631 (=> (not res!69443) (not e!56502))))

(assert (=> b!84631 (= res!69443 (invariant!0 (currentBit!4370 (_2!3830 lt!134341)) (currentByte!4375 (_2!3830 lt!134341)) (size!1815 (buf!2205 (_2!3830 lt!134341)))))))

(declare-fun b!84632 () Bool)

(declare-fun res!69445 () Bool)

(assert (=> b!84632 (=> (not res!69445) (not e!56503))))

(assert (=> b!84632 (= res!69445 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1815 (buf!2205 thiss!1136)) (size!1815 (buf!2205 thiss!1136)))))))

(declare-fun b!84633 () Bool)

(declare-fun res!69434 () Bool)

(assert (=> b!84633 (=> (not res!69434) (not e!56503))))

(assert (=> b!84633 (= res!69434 (invariant!0 (currentBit!4370 thiss!1136) (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136))))))

(declare-fun b!84634 () Bool)

(declare-fun res!69440 () Bool)

(assert (=> b!84634 (=> (not res!69440) (not e!56502))))

(assert (=> b!84634 (= res!69440 (and (bvsle (_3!210 lt!134341) nBits!333) (= (size!1815 (buf!2205 (_2!3830 lt!134341))) (size!1815 (buf!2205 thiss!1136)))))))

(declare-fun b!84635 () Bool)

(declare-fun res!69439 () Bool)

(assert (=> b!84635 (=> (not res!69439) (not e!56502))))

(assert (=> b!84635 (= res!69439 (validate_offset_bits!1 ((_ sign_extend 32) (size!1815 (buf!2205 (_2!3830 lt!134341)))) ((_ sign_extend 32) (currentByte!4375 (_2!3830 lt!134341))) ((_ sign_extend 32) (currentBit!4370 (_2!3830 lt!134341))) ((_ sign_extend 32) (bvsub nBits!333 (_3!210 lt!134341)))))))

(assert (=> b!84635 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!210 lt!134341) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!210 lt!134341)) #b10000000000000000000000000000000)))))

(declare-fun b!84636 () Bool)

(declare-fun res!69432 () Bool)

(assert (=> b!84636 (=> (not res!69432) (not e!56504))))

(declare-fun isPrefixOf!0 (BitStream!3192 BitStream!3192) Bool)

(assert (=> b!84636 (= res!69432 (isPrefixOf!0 thiss!1136 (_2!3834 lt!134337)))))

(declare-fun b!84637 () Bool)

(declare-fun Unit!5672 () Unit!5665)

(assert (=> b!84637 (= e!56501 (tuple3!373 Unit!5672 (_2!3834 lt!134338) lt!134336))))

(declare-fun b!84626 () Bool)

(declare-fun res!69436 () Bool)

(assert (=> b!84626 (=> (not res!69436) (not e!56503))))

(assert (=> b!84626 (= res!69436 (= (bitIndex!0 (size!1815 (buf!2205 thiss!1136)) (currentByte!4375 thiss!1136) (currentBit!4370 thiss!1136)) (bvadd (bitIndex!0 (size!1815 (buf!2205 thiss!1136)) (currentByte!4375 thiss!1136) (currentBit!4370 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun d!27172 () Bool)

(assert (=> d!27172 e!56502))

(declare-fun res!69435 () Bool)

(assert (=> d!27172 (=> (not res!69435) (not e!56502))))

(assert (=> d!27172 (= res!69435 (bvsge (_3!210 lt!134341) #b00000000000000000000000000000000))))

(assert (=> d!27172 (= lt!134341 e!56501)))

(declare-fun c!5828 () Bool)

(assert (=> d!27172 (= c!5828 (bvslt lt!134336 nBits!333))))

(assert (=> d!27172 (= lt!134336 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27172 (= lt!134338 lt!134337)))

(assert (=> d!27172 e!56504))

(declare-fun res!69433 () Bool)

(assert (=> d!27172 (=> (not res!69433) (not e!56504))))

(assert (=> d!27172 (= res!69433 (= (size!1815 (buf!2205 thiss!1136)) (size!1815 (buf!2205 (_2!3834 lt!134337)))))))

(declare-fun appendBit!0 (BitStream!3192 Bool) tuple2!7244)

(assert (=> d!27172 (= lt!134337 (appendBit!0 thiss!1136 lt!134339))))

(assert (=> d!27172 (= lt!134339 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27172 e!56503))

(declare-fun res!69437 () Bool)

(assert (=> d!27172 (=> (not res!69437) (not e!56503))))

(assert (=> d!27172 (= res!69437 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27172 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134341)))

(assert (= (and d!27172 res!69437) b!84633))

(assert (= (and b!84633 res!69434) b!84632))

(assert (= (and b!84632 res!69445) b!84626))

(assert (= (and b!84626 res!69436) b!84623))

(assert (= (and b!84623 res!69444) b!84624))

(assert (= (and d!27172 res!69433) b!84627))

(assert (= (and b!84627 res!69438) b!84636))

(assert (= (and b!84636 res!69432) b!84628))

(assert (= (and b!84628 res!69442) b!84630))

(assert (= (and d!27172 c!5828) b!84625))

(assert (= (and d!27172 (not c!5828)) b!84637))

(assert (= (and d!27172 res!69435) b!84631))

(assert (= (and b!84631 res!69443) b!84634))

(assert (= (and b!84634 res!69440) b!84622))

(assert (= (and b!84622 res!69441) b!84635))

(assert (= (and b!84635 res!69439) b!84629))

(declare-fun m!131113 () Bool)

(assert (=> b!84636 m!131113))

(declare-fun m!131115 () Bool)

(assert (=> d!27172 m!131115))

(declare-fun m!131117 () Bool)

(assert (=> b!84627 m!131117))

(assert (=> b!84627 m!131073))

(declare-fun m!131119 () Bool)

(assert (=> b!84630 m!131119))

(assert (=> b!84630 m!131117))

(assert (=> b!84626 m!131073))

(assert (=> b!84626 m!131073))

(declare-fun m!131121 () Bool)

(assert (=> b!84625 m!131121))

(declare-fun m!131123 () Bool)

(assert (=> b!84628 m!131123))

(assert (=> b!84628 m!131123))

(declare-fun m!131125 () Bool)

(assert (=> b!84628 m!131125))

(declare-fun m!131127 () Bool)

(assert (=> b!84635 m!131127))

(declare-fun m!131129 () Bool)

(assert (=> b!84631 m!131129))

(assert (=> b!84633 m!131071))

(declare-fun m!131131 () Bool)

(assert (=> b!84622 m!131131))

(assert (=> b!84622 m!131073))

(declare-fun m!131133 () Bool)

(assert (=> b!84623 m!131133))

(assert (=> b!84514 d!27172))

(declare-fun d!27196 () Bool)

(assert (=> d!27196 (= (array_inv!1661 (buf!2205 thiss!1136)) (bvsge (size!1815 (buf!2205 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84509 d!27196))

(declare-fun d!27198 () Bool)

(assert (=> d!27198 (= (invariant!0 (currentBit!4370 thiss!1136) (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136))) (and (bvsge (currentBit!4370 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4370 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4375 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136))) (and (= (currentBit!4370 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136)))))))))

(assert (=> b!84513 d!27198))

(declare-fun d!27200 () Bool)

(assert (=> d!27200 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4370 thiss!1136) (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136))))))

(declare-fun bs!6732 () Bool)

(assert (= bs!6732 d!27200))

(assert (=> bs!6732 m!131071))

(assert (=> start!17544 d!27200))

(declare-fun d!27202 () Bool)

(declare-fun e!56519 () Bool)

(assert (=> d!27202 e!56519))

(declare-fun res!69474 () Bool)

(assert (=> d!27202 (=> (not res!69474) (not e!56519))))

(declare-fun lt!134389 () (_ BitVec 64))

(declare-fun lt!134391 () (_ BitVec 64))

(declare-fun lt!134388 () (_ BitVec 64))

(assert (=> d!27202 (= res!69474 (= lt!134391 (bvsub lt!134388 lt!134389)))))

(assert (=> d!27202 (or (= (bvand lt!134388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134388 lt!134389) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27202 (= lt!134389 (remainingBits!0 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))) ((_ sign_extend 32) (currentByte!4375 thiss!1136)) ((_ sign_extend 32) (currentBit!4370 thiss!1136))))))

(declare-fun lt!134387 () (_ BitVec 64))

(declare-fun lt!134386 () (_ BitVec 64))

(assert (=> d!27202 (= lt!134388 (bvmul lt!134387 lt!134386))))

(assert (=> d!27202 (or (= lt!134387 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134386 (bvsdiv (bvmul lt!134387 lt!134386) lt!134387)))))

(assert (=> d!27202 (= lt!134386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27202 (= lt!134387 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))))))

(assert (=> d!27202 (= lt!134391 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4375 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4370 thiss!1136))))))

(assert (=> d!27202 (invariant!0 (currentBit!4370 thiss!1136) (currentByte!4375 thiss!1136) (size!1815 (buf!2205 thiss!1136)))))

(assert (=> d!27202 (= (bitIndex!0 (size!1815 (buf!2205 thiss!1136)) (currentByte!4375 thiss!1136) (currentBit!4370 thiss!1136)) lt!134391)))

(declare-fun b!84670 () Bool)

(declare-fun res!69475 () Bool)

(assert (=> b!84670 (=> (not res!69475) (not e!56519))))

(assert (=> b!84670 (= res!69475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134391))))

(declare-fun b!84671 () Bool)

(declare-fun lt!134390 () (_ BitVec 64))

(assert (=> b!84671 (= e!56519 (bvsle lt!134391 (bvmul lt!134390 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!84671 (or (= lt!134390 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134390 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134390)))))

(assert (=> b!84671 (= lt!134390 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))))))

(assert (= (and d!27202 res!69474) b!84670))

(assert (= (and b!84670 res!69475) b!84671))

(declare-fun m!131135 () Bool)

(assert (=> d!27202 m!131135))

(assert (=> d!27202 m!131071))

(assert (=> b!84508 d!27202))

(declare-fun d!27204 () Bool)

(assert (=> d!27204 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))) ((_ sign_extend 32) (currentByte!4375 thiss!1136)) ((_ sign_extend 32) (currentBit!4370 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1815 (buf!2205 thiss!1136))) ((_ sign_extend 32) (currentByte!4375 thiss!1136)) ((_ sign_extend 32) (currentBit!4370 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6733 () Bool)

(assert (= bs!6733 d!27204))

(assert (=> bs!6733 m!131135))

(assert (=> b!84511 d!27204))

(check-sat (not b!84628) (not b!84633) (not b!84630) (not b!84636) (not b!84626) (not d!27200) (not d!27202) (not d!27172) (not b!84635) (not b!84622) (not b!84623) (not d!27204) (not b!84631) (not b!84625) (not b!84627))

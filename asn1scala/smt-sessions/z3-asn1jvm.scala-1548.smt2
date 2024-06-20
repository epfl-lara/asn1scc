; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43508 () Bool)

(assert start!43508)

(declare-fun b!205577 () Bool)

(declare-fun res!172330 () Bool)

(declare-fun e!140657 () Bool)

(assert (=> b!205577 (=> res!172330 e!140657)))

(declare-datatypes ((array!10366 0))(
  ( (array!10367 (arr!5486 (Array (_ BitVec 32) (_ BitVec 8))) (size!4556 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8220 0))(
  ( (BitStream!8221 (buf!5061 array!10366) (currentByte!9570 (_ BitVec 32)) (currentBit!9565 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8220)

(declare-datatypes ((Unit!14669 0))(
  ( (Unit!14670) )
))
(declare-datatypes ((tuple2!17570 0))(
  ( (tuple2!17571 (_1!9440 Unit!14669) (_2!9440 BitStream!8220)) )
))
(declare-fun lt!321153 () tuple2!17570)

(declare-fun isPrefixOf!0 (BitStream!8220 BitStream!8220) Bool)

(assert (=> b!205577 (= res!172330 (not (isPrefixOf!0 thiss!1204 (_2!9440 lt!321153))))))

(declare-fun b!205578 () Bool)

(declare-fun e!140655 () Bool)

(declare-fun lt!321158 () tuple2!17570)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!205578 (= e!140655 (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321158)))))))

(declare-fun b!205579 () Bool)

(declare-fun e!140653 () Bool)

(declare-fun e!140661 () Bool)

(assert (=> b!205579 (= e!140653 e!140661)))

(declare-fun res!172335 () Bool)

(assert (=> b!205579 (=> (not res!172335) (not e!140661))))

(declare-datatypes ((tuple2!17572 0))(
  ( (tuple2!17573 (_1!9441 BitStream!8220) (_2!9441 Bool)) )
))
(declare-fun lt!321148 () tuple2!17572)

(declare-fun lt!321155 () Bool)

(assert (=> b!205579 (= res!172335 (and (= (_2!9441 lt!321148) lt!321155) (= (_1!9441 lt!321148) (_2!9440 lt!321153))))))

(declare-fun readBitPure!0 (BitStream!8220) tuple2!17572)

(declare-fun readerFrom!0 (BitStream!8220 (_ BitVec 32) (_ BitVec 32)) BitStream!8220)

(assert (=> b!205579 (= lt!321148 (readBitPure!0 (readerFrom!0 (_2!9440 lt!321153) (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204))))))

(declare-fun b!205580 () Bool)

(declare-datatypes ((tuple2!17574 0))(
  ( (tuple2!17575 (_1!9442 BitStream!8220) (_2!9442 BitStream!8220)) )
))
(declare-fun lt!321152 () tuple2!17574)

(assert (=> b!205580 (= e!140657 (= (_2!9441 (readBitPure!0 (_1!9442 lt!321152))) lt!321155))))

(declare-fun lt!321149 () tuple2!17574)

(declare-fun reader!0 (BitStream!8220 BitStream!8220) tuple2!17574)

(assert (=> b!205580 (= lt!321149 (reader!0 (_2!9440 lt!321153) (_2!9440 lt!321158)))))

(assert (=> b!205580 (= lt!321152 (reader!0 thiss!1204 (_2!9440 lt!321158)))))

(declare-fun e!140652 () Bool)

(assert (=> b!205580 e!140652))

(declare-fun res!172326 () Bool)

(assert (=> b!205580 (=> (not res!172326) (not e!140652))))

(declare-fun lt!321161 () tuple2!17572)

(declare-fun lt!321160 () tuple2!17572)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205580 (= res!172326 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321161))) (currentByte!9570 (_1!9441 lt!321161)) (currentBit!9565 (_1!9441 lt!321161))) (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321160))) (currentByte!9570 (_1!9441 lt!321160)) (currentBit!9565 (_1!9441 lt!321160)))))))

(declare-fun lt!321157 () Unit!14669)

(declare-fun lt!321151 () BitStream!8220)

(declare-fun readBitPrefixLemma!0 (BitStream!8220 BitStream!8220) Unit!14669)

(assert (=> b!205580 (= lt!321157 (readBitPrefixLemma!0 lt!321151 (_2!9440 lt!321158)))))

(assert (=> b!205580 (= lt!321160 (readBitPure!0 (BitStream!8221 (buf!5061 (_2!9440 lt!321158)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204))))))

(assert (=> b!205580 (= lt!321161 (readBitPure!0 lt!321151))))

(assert (=> b!205580 e!140655))

(declare-fun res!172340 () Bool)

(assert (=> b!205580 (=> (not res!172340) (not e!140655))))

(assert (=> b!205580 (= res!172340 (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(assert (=> b!205580 (= lt!321151 (BitStream!8221 (buf!5061 (_2!9440 lt!321153)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(declare-fun b!205581 () Bool)

(declare-fun res!172337 () Bool)

(assert (=> b!205581 (=> res!172337 e!140657)))

(assert (=> b!205581 (= res!172337 (not (isPrefixOf!0 (_2!9440 lt!321153) (_2!9440 lt!321158))))))

(declare-fun b!205582 () Bool)

(declare-fun e!140654 () Bool)

(assert (=> b!205582 (= e!140654 e!140653)))

(declare-fun res!172331 () Bool)

(assert (=> b!205582 (=> (not res!172331) (not e!140653))))

(declare-fun lt!321156 () (_ BitVec 64))

(declare-fun lt!321147 () (_ BitVec 64))

(assert (=> b!205582 (= res!172331 (= lt!321156 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!321147)))))

(assert (=> b!205582 (= lt!321156 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(assert (=> b!205582 (= lt!321147 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(declare-fun b!205583 () Bool)

(declare-fun res!172332 () Bool)

(declare-fun e!140658 () Bool)

(assert (=> b!205583 (=> (not res!172332) (not e!140658))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205583 (= res!172332 (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))) ((_ sign_extend 32) (currentByte!9570 thiss!1204)) ((_ sign_extend 32) (currentBit!9565 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!205585 () Bool)

(declare-fun res!172336 () Bool)

(assert (=> b!205585 (=> (not res!172336) (not e!140658))))

(assert (=> b!205585 (= res!172336 (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 thiss!1204))))))

(declare-fun b!205586 () Bool)

(declare-fun res!172327 () Bool)

(assert (=> b!205586 (=> res!172327 e!140657)))

(assert (=> b!205586 (= res!172327 (not (invariant!0 (currentBit!9565 (_2!9440 lt!321158)) (currentByte!9570 (_2!9440 lt!321158)) (size!4556 (buf!5061 (_2!9440 lt!321158))))))))

(declare-fun b!205587 () Bool)

(declare-fun res!172325 () Bool)

(assert (=> b!205587 (=> res!172325 e!140657)))

(declare-fun lt!321146 () (_ BitVec 64))

(declare-fun lt!321150 () (_ BitVec 64))

(assert (=> b!205587 (= res!172325 (or (not (= (size!4556 (buf!5061 (_2!9440 lt!321158))) (size!4556 (buf!5061 thiss!1204)))) (not (= lt!321146 (bvsub (bvadd lt!321150 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!205588 () Bool)

(assert (=> b!205588 (= e!140652 (= (_2!9441 lt!321161) (_2!9441 lt!321160)))))

(declare-fun b!205589 () Bool)

(declare-fun res!172328 () Bool)

(assert (=> b!205589 (=> (not res!172328) (not e!140658))))

(assert (=> b!205589 (= res!172328 (not (= i!590 nBits!348)))))

(declare-fun b!205590 () Bool)

(assert (=> b!205590 (= e!140661 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321148))) (currentByte!9570 (_1!9441 lt!321148)) (currentBit!9565 (_1!9441 lt!321148))) lt!321156))))

(declare-fun b!205591 () Bool)

(declare-fun e!140656 () Bool)

(assert (=> b!205591 (= e!140656 e!140657)))

(declare-fun res!172333 () Bool)

(assert (=> b!205591 (=> res!172333 e!140657)))

(declare-fun lt!321159 () (_ BitVec 64))

(assert (=> b!205591 (= res!172333 (not (= lt!321146 (bvsub (bvsub (bvadd lt!321159 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!205591 (= lt!321146 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321158))) (currentByte!9570 (_2!9440 lt!321158)) (currentBit!9565 (_2!9440 lt!321158))))))

(assert (=> b!205591 (isPrefixOf!0 thiss!1204 (_2!9440 lt!321158))))

(declare-fun lt!321154 () Unit!14669)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8220 BitStream!8220 BitStream!8220) Unit!14669)

(assert (=> b!205591 (= lt!321154 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9440 lt!321153) (_2!9440 lt!321158)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8220 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17570)

(assert (=> b!205591 (= lt!321158 (appendBitsLSBFirstLoopTR!0 (_2!9440 lt!321153) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!205592 () Bool)

(declare-fun res!172329 () Bool)

(assert (=> b!205592 (=> (not res!172329) (not e!140653))))

(assert (=> b!205592 (= res!172329 (isPrefixOf!0 thiss!1204 (_2!9440 lt!321153)))))

(declare-fun b!205593 () Bool)

(assert (=> b!205593 (= e!140658 (not e!140656))))

(declare-fun res!172334 () Bool)

(assert (=> b!205593 (=> res!172334 e!140656)))

(assert (=> b!205593 (= res!172334 (not (= lt!321159 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!321150))))))

(assert (=> b!205593 (= lt!321159 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(assert (=> b!205593 (= lt!321150 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(assert (=> b!205593 e!140654))

(declare-fun res!172339 () Bool)

(assert (=> b!205593 (=> (not res!172339) (not e!140654))))

(assert (=> b!205593 (= res!172339 (= (size!4556 (buf!5061 thiss!1204)) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(declare-fun appendBit!0 (BitStream!8220 Bool) tuple2!17570)

(assert (=> b!205593 (= lt!321153 (appendBit!0 thiss!1204 lt!321155))))

(assert (=> b!205593 (= lt!321155 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!172338 () Bool)

(assert (=> start!43508 (=> (not res!172338) (not e!140658))))

(assert (=> start!43508 (= res!172338 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43508 e!140658))

(assert (=> start!43508 true))

(declare-fun e!140660 () Bool)

(declare-fun inv!12 (BitStream!8220) Bool)

(assert (=> start!43508 (and (inv!12 thiss!1204) e!140660)))

(declare-fun b!205584 () Bool)

(declare-fun array_inv!4297 (array!10366) Bool)

(assert (=> b!205584 (= e!140660 (array_inv!4297 (buf!5061 thiss!1204)))))

(assert (= (and start!43508 res!172338) b!205583))

(assert (= (and b!205583 res!172332) b!205585))

(assert (= (and b!205585 res!172336) b!205589))

(assert (= (and b!205589 res!172328) b!205593))

(assert (= (and b!205593 res!172339) b!205582))

(assert (= (and b!205582 res!172331) b!205592))

(assert (= (and b!205592 res!172329) b!205579))

(assert (= (and b!205579 res!172335) b!205590))

(assert (= (and b!205593 (not res!172334)) b!205591))

(assert (= (and b!205591 (not res!172333)) b!205586))

(assert (= (and b!205586 (not res!172327)) b!205587))

(assert (= (and b!205587 (not res!172325)) b!205581))

(assert (= (and b!205581 (not res!172337)) b!205577))

(assert (= (and b!205577 (not res!172330)) b!205580))

(assert (= (and b!205580 res!172340) b!205578))

(assert (= (and b!205580 res!172326) b!205588))

(assert (= start!43508 b!205584))

(declare-fun m!316839 () Bool)

(assert (=> b!205577 m!316839))

(declare-fun m!316841 () Bool)

(assert (=> b!205582 m!316841))

(declare-fun m!316843 () Bool)

(assert (=> b!205582 m!316843))

(declare-fun m!316845 () Bool)

(assert (=> b!205581 m!316845))

(declare-fun m!316847 () Bool)

(assert (=> b!205579 m!316847))

(assert (=> b!205579 m!316847))

(declare-fun m!316849 () Bool)

(assert (=> b!205579 m!316849))

(declare-fun m!316851 () Bool)

(assert (=> b!205591 m!316851))

(declare-fun m!316853 () Bool)

(assert (=> b!205591 m!316853))

(declare-fun m!316855 () Bool)

(assert (=> b!205591 m!316855))

(declare-fun m!316857 () Bool)

(assert (=> b!205591 m!316857))

(declare-fun m!316859 () Bool)

(assert (=> b!205580 m!316859))

(declare-fun m!316861 () Bool)

(assert (=> b!205580 m!316861))

(declare-fun m!316863 () Bool)

(assert (=> b!205580 m!316863))

(declare-fun m!316865 () Bool)

(assert (=> b!205580 m!316865))

(declare-fun m!316867 () Bool)

(assert (=> b!205580 m!316867))

(declare-fun m!316869 () Bool)

(assert (=> b!205580 m!316869))

(declare-fun m!316871 () Bool)

(assert (=> b!205580 m!316871))

(declare-fun m!316873 () Bool)

(assert (=> b!205580 m!316873))

(declare-fun m!316875 () Bool)

(assert (=> b!205580 m!316875))

(declare-fun m!316877 () Bool)

(assert (=> b!205585 m!316877))

(assert (=> b!205592 m!316839))

(declare-fun m!316879 () Bool)

(assert (=> start!43508 m!316879))

(declare-fun m!316881 () Bool)

(assert (=> b!205590 m!316881))

(declare-fun m!316883 () Bool)

(assert (=> b!205583 m!316883))

(assert (=> b!205593 m!316841))

(assert (=> b!205593 m!316843))

(declare-fun m!316885 () Bool)

(assert (=> b!205593 m!316885))

(declare-fun m!316887 () Bool)

(assert (=> b!205578 m!316887))

(declare-fun m!316889 () Bool)

(assert (=> b!205584 m!316889))

(declare-fun m!316891 () Bool)

(assert (=> b!205586 m!316891))

(check-sat (not start!43508) (not b!205593) (not b!205581) (not b!205591) (not b!205584) (not b!205582) (not b!205583) (not b!205586) (not b!205585) (not b!205590) (not b!205578) (not b!205577) (not b!205579) (not b!205580) (not b!205592))
(check-sat)
(get-model)

(declare-fun d!69991 () Bool)

(declare-fun e!140694 () Bool)

(assert (=> d!69991 e!140694))

(declare-fun res!172393 () Bool)

(assert (=> d!69991 (=> (not res!172393) (not e!140694))))

(declare-fun lt!321226 () (_ BitVec 64))

(declare-fun lt!321227 () (_ BitVec 64))

(declare-fun lt!321223 () (_ BitVec 64))

(assert (=> d!69991 (= res!172393 (= lt!321226 (bvsub lt!321227 lt!321223)))))

(assert (=> d!69991 (or (= (bvand lt!321227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321227 lt!321223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69991 (= lt!321223 (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321153)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321153))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321153)))))))

(declare-fun lt!321222 () (_ BitVec 64))

(declare-fun lt!321224 () (_ BitVec 64))

(assert (=> d!69991 (= lt!321227 (bvmul lt!321222 lt!321224))))

(assert (=> d!69991 (or (= lt!321222 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321224 (bvsdiv (bvmul lt!321222 lt!321224) lt!321222)))))

(assert (=> d!69991 (= lt!321224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69991 (= lt!321222 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(assert (=> d!69991 (= lt!321226 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321153))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321153)))))))

(assert (=> d!69991 (invariant!0 (currentBit!9565 (_2!9440 lt!321153)) (currentByte!9570 (_2!9440 lt!321153)) (size!4556 (buf!5061 (_2!9440 lt!321153))))))

(assert (=> d!69991 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))) lt!321226)))

(declare-fun b!205649 () Bool)

(declare-fun res!172394 () Bool)

(assert (=> b!205649 (=> (not res!172394) (not e!140694))))

(assert (=> b!205649 (= res!172394 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321226))))

(declare-fun b!205650 () Bool)

(declare-fun lt!321225 () (_ BitVec 64))

(assert (=> b!205650 (= e!140694 (bvsle lt!321226 (bvmul lt!321225 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205650 (or (= lt!321225 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321225 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321225)))))

(assert (=> b!205650 (= lt!321225 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(assert (= (and d!69991 res!172393) b!205649))

(assert (= (and b!205649 res!172394) b!205650))

(declare-fun m!316947 () Bool)

(assert (=> d!69991 m!316947))

(declare-fun m!316949 () Bool)

(assert (=> d!69991 m!316949))

(assert (=> b!205593 d!69991))

(declare-fun d!69993 () Bool)

(declare-fun e!140695 () Bool)

(assert (=> d!69993 e!140695))

(declare-fun res!172395 () Bool)

(assert (=> d!69993 (=> (not res!172395) (not e!140695))))

(declare-fun lt!321229 () (_ BitVec 64))

(declare-fun lt!321233 () (_ BitVec 64))

(declare-fun lt!321232 () (_ BitVec 64))

(assert (=> d!69993 (= res!172395 (= lt!321232 (bvsub lt!321233 lt!321229)))))

(assert (=> d!69993 (or (= (bvand lt!321233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321233 lt!321229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69993 (= lt!321229 (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))) ((_ sign_extend 32) (currentByte!9570 thiss!1204)) ((_ sign_extend 32) (currentBit!9565 thiss!1204))))))

(declare-fun lt!321228 () (_ BitVec 64))

(declare-fun lt!321230 () (_ BitVec 64))

(assert (=> d!69993 (= lt!321233 (bvmul lt!321228 lt!321230))))

(assert (=> d!69993 (or (= lt!321228 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321230 (bvsdiv (bvmul lt!321228 lt!321230) lt!321228)))))

(assert (=> d!69993 (= lt!321230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69993 (= lt!321228 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))))))

(assert (=> d!69993 (= lt!321232 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9570 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9565 thiss!1204))))))

(assert (=> d!69993 (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 thiss!1204)))))

(assert (=> d!69993 (= (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)) lt!321232)))

(declare-fun b!205651 () Bool)

(declare-fun res!172396 () Bool)

(assert (=> b!205651 (=> (not res!172396) (not e!140695))))

(assert (=> b!205651 (= res!172396 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321232))))

(declare-fun b!205652 () Bool)

(declare-fun lt!321231 () (_ BitVec 64))

(assert (=> b!205652 (= e!140695 (bvsle lt!321232 (bvmul lt!321231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205652 (or (= lt!321231 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321231 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321231)))))

(assert (=> b!205652 (= lt!321231 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))))))

(assert (= (and d!69993 res!172395) b!205651))

(assert (= (and b!205651 res!172396) b!205652))

(declare-fun m!316951 () Bool)

(assert (=> d!69993 m!316951))

(assert (=> d!69993 m!316877))

(assert (=> b!205593 d!69993))

(declare-fun b!205665 () Bool)

(declare-fun e!140700 () Bool)

(declare-fun lt!321244 () tuple2!17572)

(declare-fun lt!321243 () tuple2!17570)

(assert (=> b!205665 (= e!140700 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321244))) (currentByte!9570 (_1!9441 lt!321244)) (currentBit!9565 (_1!9441 lt!321244))) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321243))) (currentByte!9570 (_2!9440 lt!321243)) (currentBit!9565 (_2!9440 lt!321243)))))))

(declare-fun b!205662 () Bool)

(declare-fun res!172405 () Bool)

(declare-fun e!140701 () Bool)

(assert (=> b!205662 (=> (not res!172405) (not e!140701))))

(declare-fun lt!321245 () (_ BitVec 64))

(declare-fun lt!321242 () (_ BitVec 64))

(assert (=> b!205662 (= res!172405 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321243))) (currentByte!9570 (_2!9440 lt!321243)) (currentBit!9565 (_2!9440 lt!321243))) (bvadd lt!321245 lt!321242)))))

(assert (=> b!205662 (or (not (= (bvand lt!321245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321242 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!321245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!321245 lt!321242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205662 (= lt!321242 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!205662 (= lt!321245 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(declare-fun b!205663 () Bool)

(declare-fun res!172408 () Bool)

(assert (=> b!205663 (=> (not res!172408) (not e!140701))))

(assert (=> b!205663 (= res!172408 (isPrefixOf!0 thiss!1204 (_2!9440 lt!321243)))))

(declare-fun b!205664 () Bool)

(assert (=> b!205664 (= e!140701 e!140700)))

(declare-fun res!172407 () Bool)

(assert (=> b!205664 (=> (not res!172407) (not e!140700))))

(assert (=> b!205664 (= res!172407 (and (= (_2!9441 lt!321244) lt!321155) (= (_1!9441 lt!321244) (_2!9440 lt!321243))))))

(assert (=> b!205664 (= lt!321244 (readBitPure!0 (readerFrom!0 (_2!9440 lt!321243) (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204))))))

(declare-fun d!69995 () Bool)

(assert (=> d!69995 e!140701))

(declare-fun res!172406 () Bool)

(assert (=> d!69995 (=> (not res!172406) (not e!140701))))

(assert (=> d!69995 (= res!172406 (= (size!4556 (buf!5061 thiss!1204)) (size!4556 (buf!5061 (_2!9440 lt!321243)))))))

(declare-fun choose!16 (BitStream!8220 Bool) tuple2!17570)

(assert (=> d!69995 (= lt!321243 (choose!16 thiss!1204 lt!321155))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69995 (validate_offset_bit!0 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))) ((_ sign_extend 32) (currentByte!9570 thiss!1204)) ((_ sign_extend 32) (currentBit!9565 thiss!1204)))))

(assert (=> d!69995 (= (appendBit!0 thiss!1204 lt!321155) lt!321243)))

(assert (= (and d!69995 res!172406) b!205662))

(assert (= (and b!205662 res!172405) b!205663))

(assert (= (and b!205663 res!172408) b!205664))

(assert (= (and b!205664 res!172407) b!205665))

(declare-fun m!316953 () Bool)

(assert (=> b!205664 m!316953))

(assert (=> b!205664 m!316953))

(declare-fun m!316955 () Bool)

(assert (=> b!205664 m!316955))

(declare-fun m!316957 () Bool)

(assert (=> b!205665 m!316957))

(declare-fun m!316959 () Bool)

(assert (=> b!205665 m!316959))

(declare-fun m!316961 () Bool)

(assert (=> b!205663 m!316961))

(assert (=> b!205662 m!316959))

(assert (=> b!205662 m!316843))

(declare-fun m!316963 () Bool)

(assert (=> d!69995 m!316963))

(declare-fun m!316965 () Bool)

(assert (=> d!69995 m!316965))

(assert (=> b!205593 d!69995))

(declare-fun d!69997 () Bool)

(assert (=> d!69997 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))) ((_ sign_extend 32) (currentByte!9570 thiss!1204)) ((_ sign_extend 32) (currentBit!9565 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 thiss!1204))) ((_ sign_extend 32) (currentByte!9570 thiss!1204)) ((_ sign_extend 32) (currentBit!9565 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17211 () Bool)

(assert (= bs!17211 d!69997))

(assert (=> bs!17211 m!316951))

(assert (=> b!205583 d!69997))

(declare-fun d!69999 () Bool)

(declare-fun res!172417 () Bool)

(declare-fun e!140706 () Bool)

(assert (=> d!69999 (=> (not res!172417) (not e!140706))))

(assert (=> d!69999 (= res!172417 (= (size!4556 (buf!5061 (_2!9440 lt!321153))) (size!4556 (buf!5061 (_2!9440 lt!321158)))))))

(assert (=> d!69999 (= (isPrefixOf!0 (_2!9440 lt!321153) (_2!9440 lt!321158)) e!140706)))

(declare-fun b!205672 () Bool)

(declare-fun res!172415 () Bool)

(assert (=> b!205672 (=> (not res!172415) (not e!140706))))

(assert (=> b!205672 (= res!172415 (bvsle (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321158))) (currentByte!9570 (_2!9440 lt!321158)) (currentBit!9565 (_2!9440 lt!321158)))))))

(declare-fun b!205673 () Bool)

(declare-fun e!140707 () Bool)

(assert (=> b!205673 (= e!140706 e!140707)))

(declare-fun res!172416 () Bool)

(assert (=> b!205673 (=> res!172416 e!140707)))

(assert (=> b!205673 (= res!172416 (= (size!4556 (buf!5061 (_2!9440 lt!321153))) #b00000000000000000000000000000000))))

(declare-fun b!205674 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10366 array!10366 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!205674 (= e!140707 (arrayBitRangesEq!0 (buf!5061 (_2!9440 lt!321153)) (buf!5061 (_2!9440 lt!321158)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153)))))))

(assert (= (and d!69999 res!172417) b!205672))

(assert (= (and b!205672 res!172415) b!205673))

(assert (= (and b!205673 (not res!172416)) b!205674))

(assert (=> b!205672 m!316841))

(assert (=> b!205672 m!316851))

(assert (=> b!205674 m!316841))

(assert (=> b!205674 m!316841))

(declare-fun m!316967 () Bool)

(assert (=> b!205674 m!316967))

(assert (=> b!205581 d!69999))

(declare-fun d!70001 () Bool)

(declare-fun res!172420 () Bool)

(declare-fun e!140708 () Bool)

(assert (=> d!70001 (=> (not res!172420) (not e!140708))))

(assert (=> d!70001 (= res!172420 (= (size!4556 (buf!5061 thiss!1204)) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(assert (=> d!70001 (= (isPrefixOf!0 thiss!1204 (_2!9440 lt!321153)) e!140708)))

(declare-fun b!205675 () Bool)

(declare-fun res!172418 () Bool)

(assert (=> b!205675 (=> (not res!172418) (not e!140708))))

(assert (=> b!205675 (= res!172418 (bvsle (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153)))))))

(declare-fun b!205676 () Bool)

(declare-fun e!140709 () Bool)

(assert (=> b!205676 (= e!140708 e!140709)))

(declare-fun res!172419 () Bool)

(assert (=> b!205676 (=> res!172419 e!140709)))

(assert (=> b!205676 (= res!172419 (= (size!4556 (buf!5061 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205677 () Bool)

(assert (=> b!205677 (= e!140709 (arrayBitRangesEq!0 (buf!5061 thiss!1204) (buf!5061 (_2!9440 lt!321153)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204))))))

(assert (= (and d!70001 res!172420) b!205675))

(assert (= (and b!205675 res!172418) b!205676))

(assert (= (and b!205676 (not res!172419)) b!205677))

(assert (=> b!205675 m!316843))

(assert (=> b!205675 m!316841))

(assert (=> b!205677 m!316843))

(assert (=> b!205677 m!316843))

(declare-fun m!316969 () Bool)

(assert (=> b!205677 m!316969))

(assert (=> b!205592 d!70001))

(assert (=> b!205582 d!69991))

(assert (=> b!205582 d!69993))

(declare-fun d!70003 () Bool)

(assert (=> d!70003 (= (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 thiss!1204))) (and (bvsge (currentBit!9565 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9565 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9570 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9570 thiss!1204) (size!4556 (buf!5061 thiss!1204))) (and (= (currentBit!9565 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9570 thiss!1204) (size!4556 (buf!5061 thiss!1204)))))))))

(assert (=> b!205585 d!70003))

(declare-fun d!70005 () Bool)

(assert (=> d!70005 (= (invariant!0 (currentBit!9565 (_2!9440 lt!321158)) (currentByte!9570 (_2!9440 lt!321158)) (size!4556 (buf!5061 (_2!9440 lt!321158)))) (and (bvsge (currentBit!9565 (_2!9440 lt!321158)) #b00000000000000000000000000000000) (bvslt (currentBit!9565 (_2!9440 lt!321158)) #b00000000000000000000000000001000) (bvsge (currentByte!9570 (_2!9440 lt!321158)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9570 (_2!9440 lt!321158)) (size!4556 (buf!5061 (_2!9440 lt!321158)))) (and (= (currentBit!9565 (_2!9440 lt!321158)) #b00000000000000000000000000000000) (= (currentByte!9570 (_2!9440 lt!321158)) (size!4556 (buf!5061 (_2!9440 lt!321158))))))))))

(assert (=> b!205586 d!70005))

(declare-fun d!70007 () Bool)

(assert (=> d!70007 (= (array_inv!4297 (buf!5061 thiss!1204)) (bvsge (size!4556 (buf!5061 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!205584 d!70007))

(assert (=> b!205577 d!70001))

(declare-fun d!70009 () Bool)

(assert (=> d!70009 (= (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321158)))) (and (bvsge (currentBit!9565 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9565 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9570 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321158)))) (and (= (currentBit!9565 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321158))))))))))

(assert (=> b!205578 d!70009))

(declare-fun d!70011 () Bool)

(assert (=> d!70011 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 thiss!1204))))))

(declare-fun bs!17212 () Bool)

(assert (= bs!17212 d!70011))

(assert (=> bs!17212 m!316877))

(assert (=> start!43508 d!70011))

(declare-fun d!70013 () Bool)

(declare-fun e!140715 () Bool)

(assert (=> d!70013 e!140715))

(declare-fun res!172428 () Bool)

(assert (=> d!70013 (=> (not res!172428) (not e!140715))))

(declare-fun lt!321294 () tuple2!17574)

(assert (=> d!70013 (= res!172428 (isPrefixOf!0 (_1!9442 lt!321294) (_2!9442 lt!321294)))))

(declare-fun lt!321292 () BitStream!8220)

(assert (=> d!70013 (= lt!321294 (tuple2!17575 lt!321292 (_2!9440 lt!321158)))))

(declare-fun lt!321293 () Unit!14669)

(declare-fun lt!321289 () Unit!14669)

(assert (=> d!70013 (= lt!321293 lt!321289)))

(assert (=> d!70013 (isPrefixOf!0 lt!321292 (_2!9440 lt!321158))))

(assert (=> d!70013 (= lt!321289 (lemmaIsPrefixTransitive!0 lt!321292 (_2!9440 lt!321158) (_2!9440 lt!321158)))))

(declare-fun lt!321287 () Unit!14669)

(declare-fun lt!321298 () Unit!14669)

(assert (=> d!70013 (= lt!321287 lt!321298)))

(assert (=> d!70013 (isPrefixOf!0 lt!321292 (_2!9440 lt!321158))))

(assert (=> d!70013 (= lt!321298 (lemmaIsPrefixTransitive!0 lt!321292 thiss!1204 (_2!9440 lt!321158)))))

(declare-fun lt!321301 () Unit!14669)

(declare-fun e!140714 () Unit!14669)

(assert (=> d!70013 (= lt!321301 e!140714)))

(declare-fun c!10181 () Bool)

(assert (=> d!70013 (= c!10181 (not (= (size!4556 (buf!5061 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!321305 () Unit!14669)

(declare-fun lt!321299 () Unit!14669)

(assert (=> d!70013 (= lt!321305 lt!321299)))

(assert (=> d!70013 (isPrefixOf!0 (_2!9440 lt!321158) (_2!9440 lt!321158))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8220) Unit!14669)

(assert (=> d!70013 (= lt!321299 (lemmaIsPrefixRefl!0 (_2!9440 lt!321158)))))

(declare-fun lt!321303 () Unit!14669)

(declare-fun lt!321302 () Unit!14669)

(assert (=> d!70013 (= lt!321303 lt!321302)))

(assert (=> d!70013 (= lt!321302 (lemmaIsPrefixRefl!0 (_2!9440 lt!321158)))))

(declare-fun lt!321291 () Unit!14669)

(declare-fun lt!321295 () Unit!14669)

(assert (=> d!70013 (= lt!321291 lt!321295)))

(assert (=> d!70013 (isPrefixOf!0 lt!321292 lt!321292)))

(assert (=> d!70013 (= lt!321295 (lemmaIsPrefixRefl!0 lt!321292))))

(declare-fun lt!321300 () Unit!14669)

(declare-fun lt!321290 () Unit!14669)

(assert (=> d!70013 (= lt!321300 lt!321290)))

(assert (=> d!70013 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70013 (= lt!321290 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70013 (= lt!321292 (BitStream!8221 (buf!5061 (_2!9440 lt!321158)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(assert (=> d!70013 (isPrefixOf!0 thiss!1204 (_2!9440 lt!321158))))

(assert (=> d!70013 (= (reader!0 thiss!1204 (_2!9440 lt!321158)) lt!321294)))

(declare-fun b!205688 () Bool)

(declare-fun lt!321297 () Unit!14669)

(assert (=> b!205688 (= e!140714 lt!321297)))

(declare-fun lt!321286 () (_ BitVec 64))

(assert (=> b!205688 (= lt!321286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!321296 () (_ BitVec 64))

(assert (=> b!205688 (= lt!321296 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10366 array!10366 (_ BitVec 64) (_ BitVec 64)) Unit!14669)

(assert (=> b!205688 (= lt!321297 (arrayBitRangesEqSymmetric!0 (buf!5061 thiss!1204) (buf!5061 (_2!9440 lt!321158)) lt!321286 lt!321296))))

(assert (=> b!205688 (arrayBitRangesEq!0 (buf!5061 (_2!9440 lt!321158)) (buf!5061 thiss!1204) lt!321286 lt!321296)))

(declare-fun lt!321304 () (_ BitVec 64))

(declare-fun b!205689 () Bool)

(declare-fun lt!321288 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8220 (_ BitVec 64)) BitStream!8220)

(assert (=> b!205689 (= e!140715 (= (_1!9442 lt!321294) (withMovedBitIndex!0 (_2!9442 lt!321294) (bvsub lt!321304 lt!321288))))))

(assert (=> b!205689 (or (= (bvand lt!321304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321304 lt!321288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205689 (= lt!321288 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321158))) (currentByte!9570 (_2!9440 lt!321158)) (currentBit!9565 (_2!9440 lt!321158))))))

(assert (=> b!205689 (= lt!321304 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(declare-fun b!205690 () Bool)

(declare-fun Unit!14673 () Unit!14669)

(assert (=> b!205690 (= e!140714 Unit!14673)))

(declare-fun b!205691 () Bool)

(declare-fun res!172429 () Bool)

(assert (=> b!205691 (=> (not res!172429) (not e!140715))))

(assert (=> b!205691 (= res!172429 (isPrefixOf!0 (_1!9442 lt!321294) thiss!1204))))

(declare-fun b!205692 () Bool)

(declare-fun res!172427 () Bool)

(assert (=> b!205692 (=> (not res!172427) (not e!140715))))

(assert (=> b!205692 (= res!172427 (isPrefixOf!0 (_2!9442 lt!321294) (_2!9440 lt!321158)))))

(assert (= (and d!70013 c!10181) b!205688))

(assert (= (and d!70013 (not c!10181)) b!205690))

(assert (= (and d!70013 res!172428) b!205691))

(assert (= (and b!205691 res!172429) b!205692))

(assert (= (and b!205692 res!172427) b!205689))

(assert (=> b!205688 m!316843))

(declare-fun m!316971 () Bool)

(assert (=> b!205688 m!316971))

(declare-fun m!316973 () Bool)

(assert (=> b!205688 m!316973))

(declare-fun m!316975 () Bool)

(assert (=> d!70013 m!316975))

(assert (=> d!70013 m!316853))

(declare-fun m!316977 () Bool)

(assert (=> d!70013 m!316977))

(declare-fun m!316979 () Bool)

(assert (=> d!70013 m!316979))

(declare-fun m!316981 () Bool)

(assert (=> d!70013 m!316981))

(declare-fun m!316983 () Bool)

(assert (=> d!70013 m!316983))

(declare-fun m!316985 () Bool)

(assert (=> d!70013 m!316985))

(declare-fun m!316987 () Bool)

(assert (=> d!70013 m!316987))

(declare-fun m!316989 () Bool)

(assert (=> d!70013 m!316989))

(declare-fun m!316991 () Bool)

(assert (=> d!70013 m!316991))

(declare-fun m!316993 () Bool)

(assert (=> d!70013 m!316993))

(declare-fun m!316995 () Bool)

(assert (=> b!205692 m!316995))

(declare-fun m!316997 () Bool)

(assert (=> b!205691 m!316997))

(declare-fun m!316999 () Bool)

(assert (=> b!205689 m!316999))

(assert (=> b!205689 m!316851))

(assert (=> b!205689 m!316843))

(assert (=> b!205580 d!70013))

(declare-fun d!70015 () Bool)

(declare-datatypes ((tuple2!17582 0))(
  ( (tuple2!17583 (_1!9446 Bool) (_2!9446 BitStream!8220)) )
))
(declare-fun lt!321308 () tuple2!17582)

(declare-fun readBit!0 (BitStream!8220) tuple2!17582)

(assert (=> d!70015 (= lt!321308 (readBit!0 (BitStream!8221 (buf!5061 (_2!9440 lt!321158)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204))))))

(assert (=> d!70015 (= (readBitPure!0 (BitStream!8221 (buf!5061 (_2!9440 lt!321158)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204))) (tuple2!17573 (_2!9446 lt!321308) (_1!9446 lt!321308)))))

(declare-fun bs!17213 () Bool)

(assert (= bs!17213 d!70015))

(declare-fun m!317001 () Bool)

(assert (=> bs!17213 m!317001))

(assert (=> b!205580 d!70015))

(declare-fun d!70017 () Bool)

(declare-fun e!140718 () Bool)

(assert (=> d!70017 e!140718))

(declare-fun res!172432 () Bool)

(assert (=> d!70017 (=> (not res!172432) (not e!140718))))

(declare-fun lt!321317 () tuple2!17572)

(declare-fun lt!321320 () tuple2!17572)

(assert (=> d!70017 (= res!172432 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321317))) (currentByte!9570 (_1!9441 lt!321317)) (currentBit!9565 (_1!9441 lt!321317))) (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321320))) (currentByte!9570 (_1!9441 lt!321320)) (currentBit!9565 (_1!9441 lt!321320)))))))

(declare-fun lt!321318 () BitStream!8220)

(declare-fun lt!321319 () Unit!14669)

(declare-fun choose!50 (BitStream!8220 BitStream!8220 BitStream!8220 tuple2!17572 tuple2!17572 BitStream!8220 Bool tuple2!17572 tuple2!17572 BitStream!8220 Bool) Unit!14669)

(assert (=> d!70017 (= lt!321319 (choose!50 lt!321151 (_2!9440 lt!321158) lt!321318 lt!321317 (tuple2!17573 (_1!9441 lt!321317) (_2!9441 lt!321317)) (_1!9441 lt!321317) (_2!9441 lt!321317) lt!321320 (tuple2!17573 (_1!9441 lt!321320) (_2!9441 lt!321320)) (_1!9441 lt!321320) (_2!9441 lt!321320)))))

(assert (=> d!70017 (= lt!321320 (readBitPure!0 lt!321318))))

(assert (=> d!70017 (= lt!321317 (readBitPure!0 lt!321151))))

(assert (=> d!70017 (= lt!321318 (BitStream!8221 (buf!5061 (_2!9440 lt!321158)) (currentByte!9570 lt!321151) (currentBit!9565 lt!321151)))))

(assert (=> d!70017 (invariant!0 (currentBit!9565 lt!321151) (currentByte!9570 lt!321151) (size!4556 (buf!5061 (_2!9440 lt!321158))))))

(assert (=> d!70017 (= (readBitPrefixLemma!0 lt!321151 (_2!9440 lt!321158)) lt!321319)))

(declare-fun b!205695 () Bool)

(assert (=> b!205695 (= e!140718 (= (_2!9441 lt!321317) (_2!9441 lt!321320)))))

(assert (= (and d!70017 res!172432) b!205695))

(assert (=> d!70017 m!316873))

(declare-fun m!317003 () Bool)

(assert (=> d!70017 m!317003))

(declare-fun m!317005 () Bool)

(assert (=> d!70017 m!317005))

(declare-fun m!317007 () Bool)

(assert (=> d!70017 m!317007))

(declare-fun m!317009 () Bool)

(assert (=> d!70017 m!317009))

(declare-fun m!317011 () Bool)

(assert (=> d!70017 m!317011))

(assert (=> b!205580 d!70017))

(declare-fun d!70019 () Bool)

(declare-fun e!140720 () Bool)

(assert (=> d!70019 e!140720))

(declare-fun res!172434 () Bool)

(assert (=> d!70019 (=> (not res!172434) (not e!140720))))

(declare-fun lt!321329 () tuple2!17574)

(assert (=> d!70019 (= res!172434 (isPrefixOf!0 (_1!9442 lt!321329) (_2!9442 lt!321329)))))

(declare-fun lt!321327 () BitStream!8220)

(assert (=> d!70019 (= lt!321329 (tuple2!17575 lt!321327 (_2!9440 lt!321158)))))

(declare-fun lt!321328 () Unit!14669)

(declare-fun lt!321324 () Unit!14669)

(assert (=> d!70019 (= lt!321328 lt!321324)))

(assert (=> d!70019 (isPrefixOf!0 lt!321327 (_2!9440 lt!321158))))

(assert (=> d!70019 (= lt!321324 (lemmaIsPrefixTransitive!0 lt!321327 (_2!9440 lt!321158) (_2!9440 lt!321158)))))

(declare-fun lt!321322 () Unit!14669)

(declare-fun lt!321333 () Unit!14669)

(assert (=> d!70019 (= lt!321322 lt!321333)))

(assert (=> d!70019 (isPrefixOf!0 lt!321327 (_2!9440 lt!321158))))

(assert (=> d!70019 (= lt!321333 (lemmaIsPrefixTransitive!0 lt!321327 (_2!9440 lt!321153) (_2!9440 lt!321158)))))

(declare-fun lt!321336 () Unit!14669)

(declare-fun e!140719 () Unit!14669)

(assert (=> d!70019 (= lt!321336 e!140719)))

(declare-fun c!10182 () Bool)

(assert (=> d!70019 (= c!10182 (not (= (size!4556 (buf!5061 (_2!9440 lt!321153))) #b00000000000000000000000000000000)))))

(declare-fun lt!321340 () Unit!14669)

(declare-fun lt!321334 () Unit!14669)

(assert (=> d!70019 (= lt!321340 lt!321334)))

(assert (=> d!70019 (isPrefixOf!0 (_2!9440 lt!321158) (_2!9440 lt!321158))))

(assert (=> d!70019 (= lt!321334 (lemmaIsPrefixRefl!0 (_2!9440 lt!321158)))))

(declare-fun lt!321338 () Unit!14669)

(declare-fun lt!321337 () Unit!14669)

(assert (=> d!70019 (= lt!321338 lt!321337)))

(assert (=> d!70019 (= lt!321337 (lemmaIsPrefixRefl!0 (_2!9440 lt!321158)))))

(declare-fun lt!321326 () Unit!14669)

(declare-fun lt!321330 () Unit!14669)

(assert (=> d!70019 (= lt!321326 lt!321330)))

(assert (=> d!70019 (isPrefixOf!0 lt!321327 lt!321327)))

(assert (=> d!70019 (= lt!321330 (lemmaIsPrefixRefl!0 lt!321327))))

(declare-fun lt!321335 () Unit!14669)

(declare-fun lt!321325 () Unit!14669)

(assert (=> d!70019 (= lt!321335 lt!321325)))

(assert (=> d!70019 (isPrefixOf!0 (_2!9440 lt!321153) (_2!9440 lt!321153))))

(assert (=> d!70019 (= lt!321325 (lemmaIsPrefixRefl!0 (_2!9440 lt!321153)))))

(assert (=> d!70019 (= lt!321327 (BitStream!8221 (buf!5061 (_2!9440 lt!321158)) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(assert (=> d!70019 (isPrefixOf!0 (_2!9440 lt!321153) (_2!9440 lt!321158))))

(assert (=> d!70019 (= (reader!0 (_2!9440 lt!321153) (_2!9440 lt!321158)) lt!321329)))

(declare-fun b!205696 () Bool)

(declare-fun lt!321332 () Unit!14669)

(assert (=> b!205696 (= e!140719 lt!321332)))

(declare-fun lt!321321 () (_ BitVec 64))

(assert (=> b!205696 (= lt!321321 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!321331 () (_ BitVec 64))

(assert (=> b!205696 (= lt!321331 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(assert (=> b!205696 (= lt!321332 (arrayBitRangesEqSymmetric!0 (buf!5061 (_2!9440 lt!321153)) (buf!5061 (_2!9440 lt!321158)) lt!321321 lt!321331))))

(assert (=> b!205696 (arrayBitRangesEq!0 (buf!5061 (_2!9440 lt!321158)) (buf!5061 (_2!9440 lt!321153)) lt!321321 lt!321331)))

(declare-fun lt!321339 () (_ BitVec 64))

(declare-fun lt!321323 () (_ BitVec 64))

(declare-fun b!205697 () Bool)

(assert (=> b!205697 (= e!140720 (= (_1!9442 lt!321329) (withMovedBitIndex!0 (_2!9442 lt!321329) (bvsub lt!321339 lt!321323))))))

(assert (=> b!205697 (or (= (bvand lt!321339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321323 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321339 lt!321323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205697 (= lt!321323 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321158))) (currentByte!9570 (_2!9440 lt!321158)) (currentBit!9565 (_2!9440 lt!321158))))))

(assert (=> b!205697 (= lt!321339 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(declare-fun b!205698 () Bool)

(declare-fun Unit!14674 () Unit!14669)

(assert (=> b!205698 (= e!140719 Unit!14674)))

(declare-fun b!205699 () Bool)

(declare-fun res!172435 () Bool)

(assert (=> b!205699 (=> (not res!172435) (not e!140720))))

(assert (=> b!205699 (= res!172435 (isPrefixOf!0 (_1!9442 lt!321329) (_2!9440 lt!321153)))))

(declare-fun b!205700 () Bool)

(declare-fun res!172433 () Bool)

(assert (=> b!205700 (=> (not res!172433) (not e!140720))))

(assert (=> b!205700 (= res!172433 (isPrefixOf!0 (_2!9442 lt!321329) (_2!9440 lt!321158)))))

(assert (= (and d!70019 c!10182) b!205696))

(assert (= (and d!70019 (not c!10182)) b!205698))

(assert (= (and d!70019 res!172434) b!205699))

(assert (= (and b!205699 res!172435) b!205700))

(assert (= (and b!205700 res!172433) b!205697))

(assert (=> b!205696 m!316841))

(declare-fun m!317013 () Bool)

(assert (=> b!205696 m!317013))

(declare-fun m!317015 () Bool)

(assert (=> b!205696 m!317015))

(declare-fun m!317017 () Bool)

(assert (=> d!70019 m!317017))

(assert (=> d!70019 m!316845))

(declare-fun m!317019 () Bool)

(assert (=> d!70019 m!317019))

(declare-fun m!317021 () Bool)

(assert (=> d!70019 m!317021))

(declare-fun m!317023 () Bool)

(assert (=> d!70019 m!317023))

(declare-fun m!317025 () Bool)

(assert (=> d!70019 m!317025))

(assert (=> d!70019 m!316985))

(assert (=> d!70019 m!316987))

(declare-fun m!317027 () Bool)

(assert (=> d!70019 m!317027))

(declare-fun m!317029 () Bool)

(assert (=> d!70019 m!317029))

(declare-fun m!317031 () Bool)

(assert (=> d!70019 m!317031))

(declare-fun m!317033 () Bool)

(assert (=> b!205700 m!317033))

(declare-fun m!317035 () Bool)

(assert (=> b!205699 m!317035))

(declare-fun m!317037 () Bool)

(assert (=> b!205697 m!317037))

(assert (=> b!205697 m!316851))

(assert (=> b!205697 m!316841))

(assert (=> b!205580 d!70019))

(declare-fun d!70021 () Bool)

(declare-fun lt!321341 () tuple2!17582)

(assert (=> d!70021 (= lt!321341 (readBit!0 lt!321151))))

(assert (=> d!70021 (= (readBitPure!0 lt!321151) (tuple2!17573 (_2!9446 lt!321341) (_1!9446 lt!321341)))))

(declare-fun bs!17214 () Bool)

(assert (= bs!17214 d!70021))

(declare-fun m!317039 () Bool)

(assert (=> bs!17214 m!317039))

(assert (=> b!205580 d!70021))

(declare-fun d!70023 () Bool)

(declare-fun lt!321342 () tuple2!17582)

(assert (=> d!70023 (= lt!321342 (readBit!0 (_1!9442 lt!321152)))))

(assert (=> d!70023 (= (readBitPure!0 (_1!9442 lt!321152)) (tuple2!17573 (_2!9446 lt!321342) (_1!9446 lt!321342)))))

(declare-fun bs!17215 () Bool)

(assert (= bs!17215 d!70023))

(declare-fun m!317041 () Bool)

(assert (=> bs!17215 m!317041))

(assert (=> b!205580 d!70023))

(declare-fun d!70025 () Bool)

(declare-fun e!140721 () Bool)

(assert (=> d!70025 e!140721))

(declare-fun res!172436 () Bool)

(assert (=> d!70025 (=> (not res!172436) (not e!140721))))

(declare-fun lt!321347 () (_ BitVec 64))

(declare-fun lt!321348 () (_ BitVec 64))

(declare-fun lt!321344 () (_ BitVec 64))

(assert (=> d!70025 (= res!172436 (= lt!321347 (bvsub lt!321348 lt!321344)))))

(assert (=> d!70025 (or (= (bvand lt!321348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321348 lt!321344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70025 (= lt!321344 (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321160)))) ((_ sign_extend 32) (currentByte!9570 (_1!9441 lt!321160))) ((_ sign_extend 32) (currentBit!9565 (_1!9441 lt!321160)))))))

(declare-fun lt!321343 () (_ BitVec 64))

(declare-fun lt!321345 () (_ BitVec 64))

(assert (=> d!70025 (= lt!321348 (bvmul lt!321343 lt!321345))))

(assert (=> d!70025 (or (= lt!321343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321345 (bvsdiv (bvmul lt!321343 lt!321345) lt!321343)))))

(assert (=> d!70025 (= lt!321345 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70025 (= lt!321343 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321160)))))))

(assert (=> d!70025 (= lt!321347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9570 (_1!9441 lt!321160))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9565 (_1!9441 lt!321160)))))))

(assert (=> d!70025 (invariant!0 (currentBit!9565 (_1!9441 lt!321160)) (currentByte!9570 (_1!9441 lt!321160)) (size!4556 (buf!5061 (_1!9441 lt!321160))))))

(assert (=> d!70025 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321160))) (currentByte!9570 (_1!9441 lt!321160)) (currentBit!9565 (_1!9441 lt!321160))) lt!321347)))

(declare-fun b!205701 () Bool)

(declare-fun res!172437 () Bool)

(assert (=> b!205701 (=> (not res!172437) (not e!140721))))

(assert (=> b!205701 (= res!172437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321347))))

(declare-fun b!205702 () Bool)

(declare-fun lt!321346 () (_ BitVec 64))

(assert (=> b!205702 (= e!140721 (bvsle lt!321347 (bvmul lt!321346 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205702 (or (= lt!321346 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321346 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321346)))))

(assert (=> b!205702 (= lt!321346 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321160)))))))

(assert (= (and d!70025 res!172436) b!205701))

(assert (= (and b!205701 res!172437) b!205702))

(declare-fun m!317043 () Bool)

(assert (=> d!70025 m!317043))

(declare-fun m!317045 () Bool)

(assert (=> d!70025 m!317045))

(assert (=> b!205580 d!70025))

(declare-fun d!70027 () Bool)

(declare-fun e!140722 () Bool)

(assert (=> d!70027 e!140722))

(declare-fun res!172438 () Bool)

(assert (=> d!70027 (=> (not res!172438) (not e!140722))))

(declare-fun lt!321350 () (_ BitVec 64))

(declare-fun lt!321354 () (_ BitVec 64))

(declare-fun lt!321353 () (_ BitVec 64))

(assert (=> d!70027 (= res!172438 (= lt!321353 (bvsub lt!321354 lt!321350)))))

(assert (=> d!70027 (or (= (bvand lt!321354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321354 lt!321350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70027 (= lt!321350 (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321161)))) ((_ sign_extend 32) (currentByte!9570 (_1!9441 lt!321161))) ((_ sign_extend 32) (currentBit!9565 (_1!9441 lt!321161)))))))

(declare-fun lt!321349 () (_ BitVec 64))

(declare-fun lt!321351 () (_ BitVec 64))

(assert (=> d!70027 (= lt!321354 (bvmul lt!321349 lt!321351))))

(assert (=> d!70027 (or (= lt!321349 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321351 (bvsdiv (bvmul lt!321349 lt!321351) lt!321349)))))

(assert (=> d!70027 (= lt!321351 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70027 (= lt!321349 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321161)))))))

(assert (=> d!70027 (= lt!321353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9570 (_1!9441 lt!321161))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9565 (_1!9441 lt!321161)))))))

(assert (=> d!70027 (invariant!0 (currentBit!9565 (_1!9441 lt!321161)) (currentByte!9570 (_1!9441 lt!321161)) (size!4556 (buf!5061 (_1!9441 lt!321161))))))

(assert (=> d!70027 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321161))) (currentByte!9570 (_1!9441 lt!321161)) (currentBit!9565 (_1!9441 lt!321161))) lt!321353)))

(declare-fun b!205703 () Bool)

(declare-fun res!172439 () Bool)

(assert (=> b!205703 (=> (not res!172439) (not e!140722))))

(assert (=> b!205703 (= res!172439 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321353))))

(declare-fun b!205704 () Bool)

(declare-fun lt!321352 () (_ BitVec 64))

(assert (=> b!205704 (= e!140722 (bvsle lt!321353 (bvmul lt!321352 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205704 (or (= lt!321352 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321352 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321352)))))

(assert (=> b!205704 (= lt!321352 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321161)))))))

(assert (= (and d!70027 res!172438) b!205703))

(assert (= (and b!205703 res!172439) b!205704))

(declare-fun m!317047 () Bool)

(assert (=> d!70027 m!317047))

(declare-fun m!317049 () Bool)

(assert (=> d!70027 m!317049))

(assert (=> b!205580 d!70027))

(declare-fun d!70029 () Bool)

(assert (=> d!70029 (= (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321153)))) (and (bvsge (currentBit!9565 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9565 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9570 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321153)))) (and (= (currentBit!9565 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321153))))))))))

(assert (=> b!205580 d!70029))

(declare-fun d!70031 () Bool)

(declare-fun e!140723 () Bool)

(assert (=> d!70031 e!140723))

(declare-fun res!172440 () Bool)

(assert (=> d!70031 (=> (not res!172440) (not e!140723))))

(declare-fun lt!321359 () (_ BitVec 64))

(declare-fun lt!321356 () (_ BitVec 64))

(declare-fun lt!321360 () (_ BitVec 64))

(assert (=> d!70031 (= res!172440 (= lt!321359 (bvsub lt!321360 lt!321356)))))

(assert (=> d!70031 (or (= (bvand lt!321360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321360 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321360 lt!321356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70031 (= lt!321356 (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321158)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321158))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321158)))))))

(declare-fun lt!321355 () (_ BitVec 64))

(declare-fun lt!321357 () (_ BitVec 64))

(assert (=> d!70031 (= lt!321360 (bvmul lt!321355 lt!321357))))

(assert (=> d!70031 (or (= lt!321355 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321357 (bvsdiv (bvmul lt!321355 lt!321357) lt!321355)))))

(assert (=> d!70031 (= lt!321357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70031 (= lt!321355 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321158)))))))

(assert (=> d!70031 (= lt!321359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321158))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321158)))))))

(assert (=> d!70031 (invariant!0 (currentBit!9565 (_2!9440 lt!321158)) (currentByte!9570 (_2!9440 lt!321158)) (size!4556 (buf!5061 (_2!9440 lt!321158))))))

(assert (=> d!70031 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321158))) (currentByte!9570 (_2!9440 lt!321158)) (currentBit!9565 (_2!9440 lt!321158))) lt!321359)))

(declare-fun b!205705 () Bool)

(declare-fun res!172441 () Bool)

(assert (=> b!205705 (=> (not res!172441) (not e!140723))))

(assert (=> b!205705 (= res!172441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321359))))

(declare-fun b!205706 () Bool)

(declare-fun lt!321358 () (_ BitVec 64))

(assert (=> b!205706 (= e!140723 (bvsle lt!321359 (bvmul lt!321358 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205706 (or (= lt!321358 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321358 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321358)))))

(assert (=> b!205706 (= lt!321358 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321158)))))))

(assert (= (and d!70031 res!172440) b!205705))

(assert (= (and b!205705 res!172441) b!205706))

(declare-fun m!317051 () Bool)

(assert (=> d!70031 m!317051))

(assert (=> d!70031 m!316891))

(assert (=> b!205591 d!70031))

(declare-fun d!70033 () Bool)

(declare-fun res!172444 () Bool)

(declare-fun e!140724 () Bool)

(assert (=> d!70033 (=> (not res!172444) (not e!140724))))

(assert (=> d!70033 (= res!172444 (= (size!4556 (buf!5061 thiss!1204)) (size!4556 (buf!5061 (_2!9440 lt!321158)))))))

(assert (=> d!70033 (= (isPrefixOf!0 thiss!1204 (_2!9440 lt!321158)) e!140724)))

(declare-fun b!205707 () Bool)

(declare-fun res!172442 () Bool)

(assert (=> b!205707 (=> (not res!172442) (not e!140724))))

(assert (=> b!205707 (= res!172442 (bvsle (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321158))) (currentByte!9570 (_2!9440 lt!321158)) (currentBit!9565 (_2!9440 lt!321158)))))))

(declare-fun b!205708 () Bool)

(declare-fun e!140725 () Bool)

(assert (=> b!205708 (= e!140724 e!140725)))

(declare-fun res!172443 () Bool)

(assert (=> b!205708 (=> res!172443 e!140725)))

(assert (=> b!205708 (= res!172443 (= (size!4556 (buf!5061 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!205709 () Bool)

(assert (=> b!205709 (= e!140725 (arrayBitRangesEq!0 (buf!5061 thiss!1204) (buf!5061 (_2!9440 lt!321158)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4556 (buf!5061 thiss!1204)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204))))))

(assert (= (and d!70033 res!172444) b!205707))

(assert (= (and b!205707 res!172442) b!205708))

(assert (= (and b!205708 (not res!172443)) b!205709))

(assert (=> b!205707 m!316843))

(assert (=> b!205707 m!316851))

(assert (=> b!205709 m!316843))

(assert (=> b!205709 m!316843))

(declare-fun m!317053 () Bool)

(assert (=> b!205709 m!317053))

(assert (=> b!205591 d!70033))

(declare-fun d!70035 () Bool)

(assert (=> d!70035 (isPrefixOf!0 thiss!1204 (_2!9440 lt!321158))))

(declare-fun lt!321363 () Unit!14669)

(declare-fun choose!30 (BitStream!8220 BitStream!8220 BitStream!8220) Unit!14669)

(assert (=> d!70035 (= lt!321363 (choose!30 thiss!1204 (_2!9440 lt!321153) (_2!9440 lt!321158)))))

(assert (=> d!70035 (isPrefixOf!0 thiss!1204 (_2!9440 lt!321153))))

(assert (=> d!70035 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9440 lt!321153) (_2!9440 lt!321158)) lt!321363)))

(declare-fun bs!17216 () Bool)

(assert (= bs!17216 d!70035))

(assert (=> bs!17216 m!316853))

(declare-fun m!317055 () Bool)

(assert (=> bs!17216 m!317055))

(assert (=> bs!17216 m!316839))

(assert (=> b!205591 d!70035))

(declare-fun b!205811 () Bool)

(declare-fun e!140787 () Bool)

(declare-datatypes ((tuple2!17584 0))(
  ( (tuple2!17585 (_1!9447 BitStream!8220) (_2!9447 (_ BitVec 64))) )
))
(declare-fun lt!321678 () tuple2!17584)

(declare-fun lt!321687 () tuple2!17574)

(assert (=> b!205811 (= e!140787 (= (_1!9447 lt!321678) (_2!9442 lt!321687)))))

(declare-fun b!205812 () Bool)

(declare-fun res!172541 () Bool)

(declare-fun lt!321664 () tuple2!17570)

(assert (=> b!205812 (= res!172541 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321664))) (currentByte!9570 (_2!9440 lt!321664)) (currentBit!9565 (_2!9440 lt!321664))) (bvadd (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!140790 () Bool)

(assert (=> b!205812 (=> (not res!172541) (not e!140790))))

(declare-fun c!10191 () Bool)

(declare-fun bm!3261 () Bool)

(declare-fun call!3264 () Bool)

(assert (=> bm!3261 (= call!3264 (isPrefixOf!0 (_2!9440 lt!321153) (ite c!10191 (_2!9440 lt!321153) (_2!9440 lt!321664))))))

(declare-fun b!205813 () Bool)

(declare-fun e!140788 () (_ BitVec 64))

(assert (=> b!205813 (= e!140788 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!205814 () Bool)

(declare-fun e!140785 () Bool)

(declare-fun lt!321694 () tuple2!17572)

(assert (=> b!205814 (= e!140785 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321694))) (currentByte!9570 (_1!9441 lt!321694)) (currentBit!9565 (_1!9441 lt!321694))) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321664))) (currentByte!9570 (_2!9440 lt!321664)) (currentBit!9565 (_2!9440 lt!321664)))))))

(declare-fun b!205815 () Bool)

(assert (=> b!205815 (= e!140788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!205816 () Bool)

(declare-fun res!172531 () Bool)

(declare-fun e!140784 () Bool)

(assert (=> b!205816 (=> (not res!172531) (not e!140784))))

(declare-fun lt!321696 () tuple2!17570)

(assert (=> b!205816 (= res!172531 (= (size!4556 (buf!5061 (_2!9440 lt!321153))) (size!4556 (buf!5061 (_2!9440 lt!321696)))))))

(declare-fun d!70037 () Bool)

(assert (=> d!70037 e!140784))

(declare-fun res!172539 () Bool)

(assert (=> d!70037 (=> (not res!172539) (not e!140784))))

(assert (=> d!70037 (= res!172539 (invariant!0 (currentBit!9565 (_2!9440 lt!321696)) (currentByte!9570 (_2!9440 lt!321696)) (size!4556 (buf!5061 (_2!9440 lt!321696)))))))

(declare-fun e!140786 () tuple2!17570)

(assert (=> d!70037 (= lt!321696 e!140786)))

(assert (=> d!70037 (= c!10191 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70037 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70037 (= (appendBitsLSBFirstLoopTR!0 (_2!9440 lt!321153) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!321696)))

(declare-fun b!205817 () Bool)

(declare-fun res!172534 () Bool)

(assert (=> b!205817 (=> (not res!172534) (not e!140784))))

(assert (=> b!205817 (= res!172534 (isPrefixOf!0 (_2!9440 lt!321153) (_2!9440 lt!321696)))))

(declare-fun b!205818 () Bool)

(declare-fun lt!321647 () tuple2!17570)

(assert (=> b!205818 (= e!140786 (tuple2!17571 (_1!9440 lt!321647) (_2!9440 lt!321647)))))

(declare-fun lt!321676 () Bool)

(assert (=> b!205818 (= lt!321676 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205818 (= lt!321664 (appendBit!0 (_2!9440 lt!321153) lt!321676))))

(declare-fun res!172538 () Bool)

(assert (=> b!205818 (= res!172538 (= (size!4556 (buf!5061 (_2!9440 lt!321153))) (size!4556 (buf!5061 (_2!9440 lt!321664)))))))

(assert (=> b!205818 (=> (not res!172538) (not e!140790))))

(assert (=> b!205818 e!140790))

(declare-fun lt!321652 () tuple2!17570)

(assert (=> b!205818 (= lt!321652 lt!321664)))

(assert (=> b!205818 (= lt!321647 (appendBitsLSBFirstLoopTR!0 (_2!9440 lt!321652) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!321665 () Unit!14669)

(assert (=> b!205818 (= lt!321665 (lemmaIsPrefixTransitive!0 (_2!9440 lt!321153) (_2!9440 lt!321652) (_2!9440 lt!321647)))))

(assert (=> b!205818 (isPrefixOf!0 (_2!9440 lt!321153) (_2!9440 lt!321647))))

(declare-fun lt!321692 () Unit!14669)

(assert (=> b!205818 (= lt!321692 lt!321665)))

(assert (=> b!205818 (invariant!0 (currentBit!9565 (_2!9440 lt!321153)) (currentByte!9570 (_2!9440 lt!321153)) (size!4556 (buf!5061 (_2!9440 lt!321652))))))

(declare-fun lt!321668 () BitStream!8220)

(assert (=> b!205818 (= lt!321668 (BitStream!8221 (buf!5061 (_2!9440 lt!321652)) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(assert (=> b!205818 (invariant!0 (currentBit!9565 lt!321668) (currentByte!9570 lt!321668) (size!4556 (buf!5061 (_2!9440 lt!321647))))))

(declare-fun lt!321674 () BitStream!8220)

(assert (=> b!205818 (= lt!321674 (BitStream!8221 (buf!5061 (_2!9440 lt!321647)) (currentByte!9570 lt!321668) (currentBit!9565 lt!321668)))))

(declare-fun lt!321672 () tuple2!17572)

(assert (=> b!205818 (= lt!321672 (readBitPure!0 lt!321668))))

(declare-fun lt!321677 () tuple2!17572)

(assert (=> b!205818 (= lt!321677 (readBitPure!0 lt!321674))))

(declare-fun lt!321667 () Unit!14669)

(assert (=> b!205818 (= lt!321667 (readBitPrefixLemma!0 lt!321668 (_2!9440 lt!321647)))))

(declare-fun res!172532 () Bool)

(assert (=> b!205818 (= res!172532 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321672))) (currentByte!9570 (_1!9441 lt!321672)) (currentBit!9565 (_1!9441 lt!321672))) (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321677))) (currentByte!9570 (_1!9441 lt!321677)) (currentBit!9565 (_1!9441 lt!321677)))))))

(declare-fun e!140789 () Bool)

(assert (=> b!205818 (=> (not res!172532) (not e!140789))))

(assert (=> b!205818 e!140789))

(declare-fun lt!321681 () Unit!14669)

(assert (=> b!205818 (= lt!321681 lt!321667)))

(declare-fun lt!321690 () tuple2!17574)

(assert (=> b!205818 (= lt!321690 (reader!0 (_2!9440 lt!321153) (_2!9440 lt!321647)))))

(declare-fun lt!321658 () tuple2!17574)

(assert (=> b!205818 (= lt!321658 (reader!0 (_2!9440 lt!321652) (_2!9440 lt!321647)))))

(declare-fun lt!321693 () tuple2!17572)

(assert (=> b!205818 (= lt!321693 (readBitPure!0 (_1!9442 lt!321690)))))

(assert (=> b!205818 (= (_2!9441 lt!321693) lt!321676)))

(declare-fun lt!321697 () Unit!14669)

(declare-fun Unit!14675 () Unit!14669)

(assert (=> b!205818 (= lt!321697 Unit!14675)))

(declare-fun lt!321660 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!205818 (= lt!321660 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321656 () (_ BitVec 64))

(assert (=> b!205818 (= lt!321656 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321679 () Unit!14669)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8220 array!10366 (_ BitVec 64)) Unit!14669)

(assert (=> b!205818 (= lt!321679 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9440 lt!321153) (buf!5061 (_2!9440 lt!321647)) lt!321656))))

(assert (=> b!205818 (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321647)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321153))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321153))) lt!321656)))

(declare-fun lt!321653 () Unit!14669)

(assert (=> b!205818 (= lt!321653 lt!321679)))

(declare-fun lt!321689 () tuple2!17584)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17584)

(assert (=> b!205818 (= lt!321689 (readNBitsLSBFirstsLoopPure!0 (_1!9442 lt!321690) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321660))))

(declare-fun lt!321683 () (_ BitVec 64))

(assert (=> b!205818 (= lt!321683 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!321684 () Unit!14669)

(assert (=> b!205818 (= lt!321684 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9440 lt!321652) (buf!5061 (_2!9440 lt!321647)) lt!321683))))

(assert (=> b!205818 (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321647)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321652))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321652))) lt!321683)))

(declare-fun lt!321699 () Unit!14669)

(assert (=> b!205818 (= lt!321699 lt!321684)))

(declare-fun lt!321654 () tuple2!17584)

(assert (=> b!205818 (= lt!321654 (readNBitsLSBFirstsLoopPure!0 (_1!9442 lt!321658) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!321660 (ite (_2!9441 lt!321693) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!321670 () tuple2!17584)

(assert (=> b!205818 (= lt!321670 (readNBitsLSBFirstsLoopPure!0 (_1!9442 lt!321690) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321660))))

(declare-fun c!10192 () Bool)

(assert (=> b!205818 (= c!10192 (_2!9441 (readBitPure!0 (_1!9442 lt!321690))))))

(declare-fun lt!321648 () tuple2!17584)

(assert (=> b!205818 (= lt!321648 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9442 lt!321690) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!321660 e!140788)))))

(declare-fun lt!321657 () Unit!14669)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14669)

(assert (=> b!205818 (= lt!321657 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9442 lt!321690) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!321660))))

(assert (=> b!205818 (and (= (_2!9447 lt!321670) (_2!9447 lt!321648)) (= (_1!9447 lt!321670) (_1!9447 lt!321648)))))

(declare-fun lt!321680 () Unit!14669)

(assert (=> b!205818 (= lt!321680 lt!321657)))

(assert (=> b!205818 (= (_1!9442 lt!321690) (withMovedBitIndex!0 (_2!9442 lt!321690) (bvsub (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321647))) (currentByte!9570 (_2!9440 lt!321647)) (currentBit!9565 (_2!9440 lt!321647))))))))

(declare-fun lt!321645 () Unit!14669)

(declare-fun Unit!14676 () Unit!14669)

(assert (=> b!205818 (= lt!321645 Unit!14676)))

(assert (=> b!205818 (= (_1!9442 lt!321658) (withMovedBitIndex!0 (_2!9442 lt!321658) (bvsub (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321652))) (currentByte!9570 (_2!9440 lt!321652)) (currentBit!9565 (_2!9440 lt!321652))) (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321647))) (currentByte!9570 (_2!9440 lt!321647)) (currentBit!9565 (_2!9440 lt!321647))))))))

(declare-fun lt!321691 () Unit!14669)

(declare-fun Unit!14677 () Unit!14669)

(assert (=> b!205818 (= lt!321691 Unit!14677)))

(assert (=> b!205818 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))) (bvsub (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321652))) (currentByte!9570 (_2!9440 lt!321652)) (currentBit!9565 (_2!9440 lt!321652))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!321675 () Unit!14669)

(declare-fun Unit!14678 () Unit!14669)

(assert (=> b!205818 (= lt!321675 Unit!14678)))

(assert (=> b!205818 (= (_2!9447 lt!321689) (_2!9447 lt!321654))))

(declare-fun lt!321655 () Unit!14669)

(declare-fun Unit!14679 () Unit!14669)

(assert (=> b!205818 (= lt!321655 Unit!14679)))

(assert (=> b!205818 (invariant!0 (currentBit!9565 (_2!9440 lt!321647)) (currentByte!9570 (_2!9440 lt!321647)) (size!4556 (buf!5061 (_2!9440 lt!321647))))))

(declare-fun lt!321662 () Unit!14669)

(declare-fun Unit!14680 () Unit!14669)

(assert (=> b!205818 (= lt!321662 Unit!14680)))

(assert (=> b!205818 (= (size!4556 (buf!5061 (_2!9440 lt!321153))) (size!4556 (buf!5061 (_2!9440 lt!321647))))))

(declare-fun lt!321661 () Unit!14669)

(declare-fun Unit!14681 () Unit!14669)

(assert (=> b!205818 (= lt!321661 Unit!14681)))

(assert (=> b!205818 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321647))) (currentByte!9570 (_2!9440 lt!321647)) (currentBit!9565 (_2!9440 lt!321647))) (bvsub (bvadd (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321666 () Unit!14669)

(declare-fun Unit!14682 () Unit!14669)

(assert (=> b!205818 (= lt!321666 Unit!14682)))

(declare-fun lt!321646 () Unit!14669)

(declare-fun Unit!14683 () Unit!14669)

(assert (=> b!205818 (= lt!321646 Unit!14683)))

(declare-fun lt!321682 () tuple2!17574)

(assert (=> b!205818 (= lt!321682 (reader!0 (_2!9440 lt!321153) (_2!9440 lt!321647)))))

(declare-fun lt!321649 () (_ BitVec 64))

(assert (=> b!205818 (= lt!321649 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!321700 () Unit!14669)

(assert (=> b!205818 (= lt!321700 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9440 lt!321153) (buf!5061 (_2!9440 lt!321647)) lt!321649))))

(assert (=> b!205818 (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321647)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321153))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321153))) lt!321649)))

(declare-fun lt!321671 () Unit!14669)

(assert (=> b!205818 (= lt!321671 lt!321700)))

(declare-fun lt!321685 () tuple2!17584)

(assert (=> b!205818 (= lt!321685 (readNBitsLSBFirstsLoopPure!0 (_1!9442 lt!321682) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!172537 () Bool)

(assert (=> b!205818 (= res!172537 (= (_2!9447 lt!321685) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!140783 () Bool)

(assert (=> b!205818 (=> (not res!172537) (not e!140783))))

(assert (=> b!205818 e!140783))

(declare-fun lt!321651 () Unit!14669)

(declare-fun Unit!14684 () Unit!14669)

(assert (=> b!205818 (= lt!321651 Unit!14684)))

(declare-fun b!205819 () Bool)

(declare-fun res!172540 () Bool)

(assert (=> b!205819 (= res!172540 call!3264)))

(assert (=> b!205819 (=> (not res!172540) (not e!140790))))

(declare-fun b!205820 () Bool)

(declare-fun e!140782 () Bool)

(declare-fun lt!321659 () (_ BitVec 64))

(assert (=> b!205820 (= e!140782 (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321153)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321153))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321153))) lt!321659))))

(declare-fun b!205821 () Bool)

(declare-fun res!172535 () Bool)

(assert (=> b!205821 (=> (not res!172535) (not e!140784))))

(declare-fun lt!321686 () (_ BitVec 64))

(declare-fun lt!321663 () (_ BitVec 64))

(assert (=> b!205821 (= res!172535 (= (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321696))) (currentByte!9570 (_2!9440 lt!321696)) (currentBit!9565 (_2!9440 lt!321696))) (bvsub lt!321663 lt!321686)))))

(assert (=> b!205821 (or (= (bvand lt!321663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321663 lt!321686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205821 (= lt!321686 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!321698 () (_ BitVec 64))

(declare-fun lt!321669 () (_ BitVec 64))

(assert (=> b!205821 (= lt!321663 (bvadd lt!321698 lt!321669))))

(assert (=> b!205821 (or (not (= (bvand lt!321698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321669 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!321698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!321698 lt!321669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205821 (= lt!321669 ((_ sign_extend 32) nBits!348))))

(assert (=> b!205821 (= lt!321698 (bitIndex!0 (size!4556 (buf!5061 (_2!9440 lt!321153))) (currentByte!9570 (_2!9440 lt!321153)) (currentBit!9565 (_2!9440 lt!321153))))))

(declare-fun b!205822 () Bool)

(assert (=> b!205822 (= e!140784 e!140787)))

(declare-fun res!172536 () Bool)

(assert (=> b!205822 (=> (not res!172536) (not e!140787))))

(assert (=> b!205822 (= res!172536 (= (_2!9447 lt!321678) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!205822 (= lt!321678 (readNBitsLSBFirstsLoopPure!0 (_1!9442 lt!321687) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!321688 () Unit!14669)

(declare-fun lt!321650 () Unit!14669)

(assert (=> b!205822 (= lt!321688 lt!321650)))

(assert (=> b!205822 (validate_offset_bits!1 ((_ sign_extend 32) (size!4556 (buf!5061 (_2!9440 lt!321696)))) ((_ sign_extend 32) (currentByte!9570 (_2!9440 lt!321153))) ((_ sign_extend 32) (currentBit!9565 (_2!9440 lt!321153))) lt!321659)))

(assert (=> b!205822 (= lt!321650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9440 lt!321153) (buf!5061 (_2!9440 lt!321696)) lt!321659))))

(assert (=> b!205822 e!140782))

(declare-fun res!172533 () Bool)

(assert (=> b!205822 (=> (not res!172533) (not e!140782))))

(assert (=> b!205822 (= res!172533 (and (= (size!4556 (buf!5061 (_2!9440 lt!321153))) (size!4556 (buf!5061 (_2!9440 lt!321696)))) (bvsge lt!321659 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!205822 (= lt!321659 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!205822 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!205822 (= lt!321687 (reader!0 (_2!9440 lt!321153) (_2!9440 lt!321696)))))

(declare-fun b!205823 () Bool)

(assert (=> b!205823 (= lt!321694 (readBitPure!0 (readerFrom!0 (_2!9440 lt!321664) (currentBit!9565 (_2!9440 lt!321153)) (currentByte!9570 (_2!9440 lt!321153)))))))

(declare-fun res!172530 () Bool)

(assert (=> b!205823 (= res!172530 (and (= (_2!9441 lt!321694) lt!321676) (= (_1!9441 lt!321694) (_2!9440 lt!321664))))))

(assert (=> b!205823 (=> (not res!172530) (not e!140785))))

(assert (=> b!205823 (= e!140790 e!140785)))

(declare-fun b!205824 () Bool)

(assert (=> b!205824 (= e!140783 (= (_1!9447 lt!321685) (_2!9442 lt!321682)))))

(declare-fun b!205825 () Bool)

(declare-fun Unit!14685 () Unit!14669)

(assert (=> b!205825 (= e!140786 (tuple2!17571 Unit!14685 (_2!9440 lt!321153)))))

(declare-fun lt!321673 () Unit!14669)

(assert (=> b!205825 (= lt!321673 (lemmaIsPrefixRefl!0 (_2!9440 lt!321153)))))

(assert (=> b!205825 call!3264))

(declare-fun lt!321695 () Unit!14669)

(assert (=> b!205825 (= lt!321695 lt!321673)))

(declare-fun b!205826 () Bool)

(assert (=> b!205826 (= e!140789 (= (_2!9441 lt!321672) (_2!9441 lt!321677)))))

(assert (= (and d!70037 c!10191) b!205825))

(assert (= (and d!70037 (not c!10191)) b!205818))

(assert (= (and b!205818 res!172538) b!205812))

(assert (= (and b!205812 res!172541) b!205819))

(assert (= (and b!205819 res!172540) b!205823))

(assert (= (and b!205823 res!172530) b!205814))

(assert (= (and b!205818 res!172532) b!205826))

(assert (= (and b!205818 c!10192) b!205813))

(assert (= (and b!205818 (not c!10192)) b!205815))

(assert (= (and b!205818 res!172537) b!205824))

(assert (= (or b!205825 b!205819) bm!3261))

(assert (= (and d!70037 res!172539) b!205816))

(assert (= (and b!205816 res!172531) b!205821))

(assert (= (and b!205821 res!172535) b!205817))

(assert (= (and b!205817 res!172534) b!205822))

(assert (= (and b!205822 res!172533) b!205820))

(assert (= (and b!205822 res!172536) b!205811))

(declare-fun m!317163 () Bool)

(assert (=> b!205814 m!317163))

(declare-fun m!317165 () Bool)

(assert (=> b!205814 m!317165))

(declare-fun m!317167 () Bool)

(assert (=> b!205817 m!317167))

(declare-fun m!317169 () Bool)

(assert (=> bm!3261 m!317169))

(assert (=> b!205825 m!317017))

(declare-fun m!317171 () Bool)

(assert (=> b!205821 m!317171))

(assert (=> b!205821 m!316841))

(assert (=> b!205812 m!317165))

(assert (=> b!205812 m!316841))

(declare-fun m!317173 () Bool)

(assert (=> b!205820 m!317173))

(declare-fun m!317175 () Bool)

(assert (=> b!205823 m!317175))

(assert (=> b!205823 m!317175))

(declare-fun m!317177 () Bool)

(assert (=> b!205823 m!317177))

(declare-fun m!317179 () Bool)

(assert (=> d!70037 m!317179))

(declare-fun m!317181 () Bool)

(assert (=> b!205818 m!317181))

(declare-fun m!317183 () Bool)

(assert (=> b!205818 m!317183))

(assert (=> b!205818 m!316841))

(declare-fun m!317185 () Bool)

(assert (=> b!205818 m!317185))

(declare-fun m!317187 () Bool)

(assert (=> b!205818 m!317187))

(declare-fun m!317189 () Bool)

(assert (=> b!205818 m!317189))

(declare-fun m!317191 () Bool)

(assert (=> b!205818 m!317191))

(declare-fun m!317193 () Bool)

(assert (=> b!205818 m!317193))

(declare-fun m!317195 () Bool)

(assert (=> b!205818 m!317195))

(declare-fun m!317197 () Bool)

(assert (=> b!205818 m!317197))

(declare-fun m!317199 () Bool)

(assert (=> b!205818 m!317199))

(declare-fun m!317201 () Bool)

(assert (=> b!205818 m!317201))

(declare-fun m!317203 () Bool)

(assert (=> b!205818 m!317203))

(declare-fun m!317205 () Bool)

(assert (=> b!205818 m!317205))

(declare-fun m!317207 () Bool)

(assert (=> b!205818 m!317207))

(declare-fun m!317209 () Bool)

(assert (=> b!205818 m!317209))

(declare-fun m!317211 () Bool)

(assert (=> b!205818 m!317211))

(declare-fun m!317213 () Bool)

(assert (=> b!205818 m!317213))

(declare-fun m!317215 () Bool)

(assert (=> b!205818 m!317215))

(declare-fun m!317217 () Bool)

(assert (=> b!205818 m!317217))

(assert (=> b!205818 m!317207))

(declare-fun m!317219 () Bool)

(assert (=> b!205818 m!317219))

(declare-fun m!317221 () Bool)

(assert (=> b!205818 m!317221))

(declare-fun m!317223 () Bool)

(assert (=> b!205818 m!317223))

(declare-fun m!317225 () Bool)

(assert (=> b!205818 m!317225))

(declare-fun m!317227 () Bool)

(assert (=> b!205818 m!317227))

(declare-fun m!317229 () Bool)

(assert (=> b!205818 m!317229))

(declare-fun m!317231 () Bool)

(assert (=> b!205818 m!317231))

(declare-fun m!317233 () Bool)

(assert (=> b!205818 m!317233))

(declare-fun m!317235 () Bool)

(assert (=> b!205818 m!317235))

(declare-fun m!317237 () Bool)

(assert (=> b!205818 m!317237))

(declare-fun m!317239 () Bool)

(assert (=> b!205818 m!317239))

(declare-fun m!317241 () Bool)

(assert (=> b!205818 m!317241))

(declare-fun m!317243 () Bool)

(assert (=> b!205818 m!317243))

(declare-fun m!317245 () Bool)

(assert (=> b!205818 m!317245))

(assert (=> b!205822 m!317203))

(declare-fun m!317247 () Bool)

(assert (=> b!205822 m!317247))

(assert (=> b!205822 m!317217))

(declare-fun m!317249 () Bool)

(assert (=> b!205822 m!317249))

(declare-fun m!317251 () Bool)

(assert (=> b!205822 m!317251))

(declare-fun m!317253 () Bool)

(assert (=> b!205822 m!317253))

(assert (=> b!205591 d!70037))

(declare-fun d!70097 () Bool)

(declare-fun lt!321701 () tuple2!17582)

(assert (=> d!70097 (= lt!321701 (readBit!0 (readerFrom!0 (_2!9440 lt!321153) (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204))))))

(assert (=> d!70097 (= (readBitPure!0 (readerFrom!0 (_2!9440 lt!321153) (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204))) (tuple2!17573 (_2!9446 lt!321701) (_1!9446 lt!321701)))))

(declare-fun bs!17224 () Bool)

(assert (= bs!17224 d!70097))

(assert (=> bs!17224 m!316847))

(declare-fun m!317255 () Bool)

(assert (=> bs!17224 m!317255))

(assert (=> b!205579 d!70097))

(declare-fun d!70099 () Bool)

(declare-fun e!140793 () Bool)

(assert (=> d!70099 e!140793))

(declare-fun res!172545 () Bool)

(assert (=> d!70099 (=> (not res!172545) (not e!140793))))

(assert (=> d!70099 (= res!172545 (invariant!0 (currentBit!9565 (_2!9440 lt!321153)) (currentByte!9570 (_2!9440 lt!321153)) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(assert (=> d!70099 (= (readerFrom!0 (_2!9440 lt!321153) (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204)) (BitStream!8221 (buf!5061 (_2!9440 lt!321153)) (currentByte!9570 thiss!1204) (currentBit!9565 thiss!1204)))))

(declare-fun b!205829 () Bool)

(assert (=> b!205829 (= e!140793 (invariant!0 (currentBit!9565 thiss!1204) (currentByte!9570 thiss!1204) (size!4556 (buf!5061 (_2!9440 lt!321153)))))))

(assert (= (and d!70099 res!172545) b!205829))

(assert (=> d!70099 m!316949))

(assert (=> b!205829 m!316875))

(assert (=> b!205579 d!70099))

(declare-fun d!70101 () Bool)

(declare-fun e!140794 () Bool)

(assert (=> d!70101 e!140794))

(declare-fun res!172546 () Bool)

(assert (=> d!70101 (=> (not res!172546) (not e!140794))))

(declare-fun lt!321707 () (_ BitVec 64))

(declare-fun lt!321703 () (_ BitVec 64))

(declare-fun lt!321706 () (_ BitVec 64))

(assert (=> d!70101 (= res!172546 (= lt!321706 (bvsub lt!321707 lt!321703)))))

(assert (=> d!70101 (or (= (bvand lt!321707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!321703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!321707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!321707 lt!321703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70101 (= lt!321703 (remainingBits!0 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321148)))) ((_ sign_extend 32) (currentByte!9570 (_1!9441 lt!321148))) ((_ sign_extend 32) (currentBit!9565 (_1!9441 lt!321148)))))))

(declare-fun lt!321702 () (_ BitVec 64))

(declare-fun lt!321704 () (_ BitVec 64))

(assert (=> d!70101 (= lt!321707 (bvmul lt!321702 lt!321704))))

(assert (=> d!70101 (or (= lt!321702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!321704 (bvsdiv (bvmul lt!321702 lt!321704) lt!321702)))))

(assert (=> d!70101 (= lt!321704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70101 (= lt!321702 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321148)))))))

(assert (=> d!70101 (= lt!321706 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9570 (_1!9441 lt!321148))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9565 (_1!9441 lt!321148)))))))

(assert (=> d!70101 (invariant!0 (currentBit!9565 (_1!9441 lt!321148)) (currentByte!9570 (_1!9441 lt!321148)) (size!4556 (buf!5061 (_1!9441 lt!321148))))))

(assert (=> d!70101 (= (bitIndex!0 (size!4556 (buf!5061 (_1!9441 lt!321148))) (currentByte!9570 (_1!9441 lt!321148)) (currentBit!9565 (_1!9441 lt!321148))) lt!321706)))

(declare-fun b!205830 () Bool)

(declare-fun res!172547 () Bool)

(assert (=> b!205830 (=> (not res!172547) (not e!140794))))

(assert (=> b!205830 (= res!172547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!321706))))

(declare-fun b!205831 () Bool)

(declare-fun lt!321705 () (_ BitVec 64))

(assert (=> b!205831 (= e!140794 (bvsle lt!321706 (bvmul lt!321705 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!205831 (or (= lt!321705 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!321705 #b0000000000000000000000000000000000000000000000000000000000001000) lt!321705)))))

(assert (=> b!205831 (= lt!321705 ((_ sign_extend 32) (size!4556 (buf!5061 (_1!9441 lt!321148)))))))

(assert (= (and d!70101 res!172546) b!205830))

(assert (= (and b!205830 res!172547) b!205831))

(declare-fun m!317257 () Bool)

(assert (=> d!70101 m!317257))

(declare-fun m!317259 () Bool)

(assert (=> d!70101 m!317259))

(assert (=> b!205590 d!70101))

(check-sat (not b!205677) (not d!70017) (not b!205825) (not bm!3261) (not b!205696) (not d!70019) (not b!205699) (not b!205691) (not b!205817) (not b!205822) (not d!70015) (not b!205664) (not d!70023) (not b!205818) (not b!205823) (not d!70011) (not b!205814) (not d!70025) (not b!205662) (not d!70021) (not b!205821) (not d!69991) (not b!205665) (not d!69997) (not b!205689) (not b!205707) (not b!205709) (not d!70027) (not d!70101) (not b!205692) (not d!69993) (not b!205700) (not b!205812) (not b!205688) (not b!205672) (not b!205829) (not d!70099) (not b!205675) (not d!70035) (not b!205697) (not d!70037) (not d!70097) (not d!69995) (not d!70013) (not d!70031) (not b!205674) (not b!205820) (not b!205663))

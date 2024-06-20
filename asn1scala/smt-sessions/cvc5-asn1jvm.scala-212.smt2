; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4234 () Bool)

(assert start!4234)

(declare-fun res!15464 () Bool)

(declare-fun e!11259 () Bool)

(assert (=> start!4234 (=> (not res!15464) (not e!11259))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4234 (= res!15464 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4234 e!11259))

(assert (=> start!4234 true))

(declare-datatypes ((array!1160 0))(
  ( (array!1161 (arr!922 (Array (_ BitVec 32) (_ BitVec 8))) (size!493 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!856 0))(
  ( (BitStream!857 (buf!811 array!1160) (currentByte!2014 (_ BitVec 32)) (currentBit!2009 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!856)

(declare-fun e!11258 () Bool)

(declare-fun inv!12 (BitStream!856) Bool)

(assert (=> start!4234 (and (inv!12 thiss!1917) e!11258)))

(declare-fun b!17523 () Bool)

(declare-fun res!15463 () Bool)

(assert (=> b!17523 (=> (not res!15463) (not e!11259))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17523 (= res!15463 (validate_offset_bits!1 ((_ sign_extend 32) (size!493 (buf!811 thiss!1917))) ((_ sign_extend 32) (currentByte!2014 thiss!1917)) ((_ sign_extend 32) (currentBit!2009 thiss!1917)) nBits!604))))

(declare-fun b!17524 () Bool)

(declare-datatypes ((tuple2!2048 0))(
  ( (tuple2!2049 (_1!1085 array!1160) (_2!1085 BitStream!856)) )
))
(declare-fun lt!25279 () tuple2!2048)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17524 (= e!11259 (not (invariant!0 (currentBit!2009 (_2!1085 lt!25279)) (currentByte!2014 (_2!1085 lt!25279)) (size!493 (buf!811 (_2!1085 lt!25279))))))))

(declare-fun readBits!0 (BitStream!856 (_ BitVec 64)) tuple2!2048)

(assert (=> b!17524 (= lt!25279 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17525 () Bool)

(declare-fun array_inv!463 (array!1160) Bool)

(assert (=> b!17525 (= e!11258 (array_inv!463 (buf!811 thiss!1917)))))

(assert (= (and start!4234 res!15464) b!17523))

(assert (= (and b!17523 res!15463) b!17524))

(assert (= start!4234 b!17525))

(declare-fun m!23839 () Bool)

(assert (=> start!4234 m!23839))

(declare-fun m!23841 () Bool)

(assert (=> b!17523 m!23841))

(declare-fun m!23843 () Bool)

(assert (=> b!17524 m!23843))

(declare-fun m!23845 () Bool)

(assert (=> b!17524 m!23845))

(declare-fun m!23847 () Bool)

(assert (=> b!17525 m!23847))

(push 1)

(assert (not b!17523))

(assert (not start!4234))

(assert (not b!17524))

(assert (not b!17525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5758 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!493 (buf!811 thiss!1917))) ((_ sign_extend 32) (currentByte!2014 thiss!1917)) ((_ sign_extend 32) (currentBit!2009 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!493 (buf!811 thiss!1917))) ((_ sign_extend 32) (currentByte!2014 thiss!1917)) ((_ sign_extend 32) (currentBit!2009 thiss!1917))) nBits!604))))

(declare-fun bs!1647 () Bool)

(assert (= bs!1647 d!5758))

(declare-fun m!23869 () Bool)

(assert (=> bs!1647 m!23869))

(assert (=> b!17523 d!5758))

(declare-fun d!5760 () Bool)

(assert (=> d!5760 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2009 thiss!1917) (currentByte!2014 thiss!1917) (size!493 (buf!811 thiss!1917))))))

(declare-fun bs!1648 () Bool)

(assert (= bs!1648 d!5760))

(declare-fun m!23871 () Bool)

(assert (=> bs!1648 m!23871))

(assert (=> start!4234 d!5760))

(declare-fun d!5762 () Bool)

(assert (=> d!5762 (= (invariant!0 (currentBit!2009 (_2!1085 lt!25279)) (currentByte!2014 (_2!1085 lt!25279)) (size!493 (buf!811 (_2!1085 lt!25279)))) (and (bvsge (currentBit!2009 (_2!1085 lt!25279)) #b00000000000000000000000000000000) (bvslt (currentBit!2009 (_2!1085 lt!25279)) #b00000000000000000000000000001000) (bvsge (currentByte!2014 (_2!1085 lt!25279)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2014 (_2!1085 lt!25279)) (size!493 (buf!811 (_2!1085 lt!25279)))) (and (= (currentBit!2009 (_2!1085 lt!25279)) #b00000000000000000000000000000000) (= (currentByte!2014 (_2!1085 lt!25279)) (size!493 (buf!811 (_2!1085 lt!25279))))))))))

(assert (=> b!17524 d!5762))

(declare-fun b!17560 () Bool)

(declare-fun res!15497 () Bool)

(declare-fun e!11282 () Bool)

(assert (=> b!17560 (=> (not res!15497) (not e!11282))))

(declare-fun lt!25319 () tuple2!2048)

(assert (=> b!17560 (= res!15497 (invariant!0 (currentBit!2009 (_2!1085 lt!25319)) (currentByte!2014 (_2!1085 lt!25319)) (size!493 (buf!811 (_2!1085 lt!25319)))))))

(declare-fun b!17561 () Bool)

(declare-fun res!15498 () Bool)

(assert (=> b!17561 (=> (not res!15498) (not e!11282))))

(declare-fun lt!25327 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!17561 (= res!15498 (= (bvadd lt!25327 nBits!604) (bitIndex!0 (size!493 (buf!811 (_2!1085 lt!25319))) (currentByte!2014 (_2!1085 lt!25319)) (currentBit!2009 (_2!1085 lt!25319)))))))

(assert (=> b!17561 (or (not (= (bvand lt!25327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!25327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!25327 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17561 (= lt!25327 (bitIndex!0 (size!493 (buf!811 thiss!1917)) (currentByte!2014 thiss!1917) (currentBit!2009 thiss!1917)))))

(declare-fun b!17562 () Bool)

(declare-datatypes ((List!189 0))(
  ( (Nil!186) (Cons!185 (h!304 Bool) (t!939 List!189)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!856 array!1160 (_ BitVec 64) (_ BitVec 64)) List!189)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!856 BitStream!856 (_ BitVec 64)) List!189)

(assert (=> b!17562 (= e!11282 (= (byteArrayBitContentToList!0 (_2!1085 lt!25319) (_1!1085 lt!25319) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1085 lt!25319) thiss!1917 nBits!604)))))

(declare-fun d!5764 () Bool)

(assert (=> d!5764 e!11282))

(declare-fun res!15496 () Bool)

(assert (=> d!5764 (=> (not res!15496) (not e!11282))))

(assert (=> d!5764 (= res!15496 (= (buf!811 (_2!1085 lt!25319)) (buf!811 thiss!1917)))))

(declare-datatypes ((Unit!1572 0))(
  ( (Unit!1573) )
))
(declare-datatypes ((tuple3!110 0))(
  ( (tuple3!111 (_1!1088 Unit!1572) (_2!1088 BitStream!856) (_3!61 array!1160)) )
))
(declare-fun lt!25320 () tuple3!110)

(assert (=> d!5764 (= lt!25319 (tuple2!2049 (_3!61 lt!25320) (_2!1088 lt!25320)))))

(declare-fun readBitsLoop!0 (BitStream!856 (_ BitVec 64) array!1160 (_ BitVec 64) (_ BitVec 64)) tuple3!110)

(assert (=> d!5764 (= lt!25320 (readBitsLoop!0 thiss!1917 nBits!604 (array!1161 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5764 (= (readBits!0 thiss!1917 nBits!604) lt!25319)))

(declare-fun b!17563 () Bool)

(declare-fun res!15495 () Bool)

(assert (=> b!17563 (=> (not res!15495) (not e!11282))))

(declare-fun lt!25328 () (_ BitVec 64))

(assert (=> b!17563 (= res!15495 (= (size!493 (_1!1085 lt!25319)) ((_ extract 31 0) lt!25328)))))

(assert (=> b!17563 (and (bvslt lt!25328 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!25328 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!25324 () (_ BitVec 64))

(declare-fun lt!25326 () (_ BitVec 64))

(assert (=> b!17563 (= lt!25328 (bvsdiv lt!25324 lt!25326))))

(assert (=> b!17563 (and (not (= lt!25326 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!25324 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!25326 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!17563 (= lt!25326 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!25318 () (_ BitVec 64))

(declare-fun lt!25325 () (_ BitVec 64))

(assert (=> b!17563 (= lt!25324 (bvsub lt!25318 lt!25325))))

(assert (=> b!17563 (or (= (bvand lt!25318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25325 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!25318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!25318 lt!25325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17563 (= lt!25325 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!25323 () (_ BitVec 64))

(assert (=> b!17563 (= lt!25318 (bvadd nBits!604 lt!25323))))

(assert (=> b!17563 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25323 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!25323) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17563 (= lt!25323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!17564 () Bool)

(declare-fun res!15499 () Bool)

(assert (=> b!17564 (=> (not res!15499) (not e!11282))))

(assert (=> b!17564 (= res!15499 (bvsle (currentByte!2014 thiss!1917) (currentByte!2014 (_2!1085 lt!25319))))))

(assert (= (and d!5764 res!15496) b!17561))

(assert (= (and b!17561 res!15498) b!17560))

(assert (= (and b!17560 res!15497) b!17563))

(assert (= (and b!17563 res!15495) b!17564))

(assert (= (and b!17564 res!15499) b!17562))

(declare-fun m!23877 () Bool)

(assert (=> b!17560 m!23877))

(declare-fun m!23879 () Bool)

(assert (=> b!17561 m!23879))

(declare-fun m!23881 () Bool)

(assert (=> b!17561 m!23881))

(declare-fun m!23883 () Bool)

(assert (=> b!17562 m!23883))

(declare-fun m!23885 () Bool)

(assert (=> b!17562 m!23885))

(declare-fun m!23887 () Bool)

(assert (=> d!5764 m!23887))

(assert (=> b!17524 d!5764))

(declare-fun d!5780 () Bool)

(assert (=> d!5780 (= (array_inv!463 (buf!811 thiss!1917)) (bvsge (size!493 (buf!811 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17525 d!5780))

(push 1)

(assert (not d!5758))

(assert (not d!5760))

(assert (not b!17560))

(assert (not b!17562))

(assert (not d!5764))

(assert (not b!17561))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


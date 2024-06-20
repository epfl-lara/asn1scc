; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15652 () Bool)

(assert start!15652)

(declare-fun b!79206 () Bool)

(declare-fun res!65563 () Bool)

(declare-fun e!51974 () Bool)

(assert (=> b!79206 (=> (not res!65563) (not e!51974))))

(declare-datatypes ((array!3380 0))(
  ( (array!3381 (arr!2162 (Array (_ BitVec 32) (_ BitVec 8))) (size!1561 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2684 0))(
  ( (BitStream!2685 (buf!1951 array!3380) (currentByte!3822 (_ BitVec 32)) (currentBit!3817 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2684)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79206 (= res!65563 (validate_offset_bit!0 ((_ sign_extend 32) (size!1561 (buf!1951 thiss!1107))) ((_ sign_extend 32) (currentByte!3822 thiss!1107)) ((_ sign_extend 32) (currentBit!3817 thiss!1107))))))

(declare-fun b!79207 () Bool)

(assert (=> b!79207 (= e!51974 (not true))))

(declare-fun e!51976 () Bool)

(assert (=> b!79207 e!51976))

(declare-fun res!65561 () Bool)

(assert (=> b!79207 (=> (not res!65561) (not e!51976))))

(declare-datatypes ((Unit!5207 0))(
  ( (Unit!5208) )
))
(declare-datatypes ((tuple2!7066 0))(
  ( (tuple2!7067 (_1!3670 Unit!5207) (_2!3670 BitStream!2684)) )
))
(declare-fun lt!126081 () tuple2!7066)

(assert (=> b!79207 (= res!65561 (= (size!1561 (buf!1951 thiss!1107)) (size!1561 (buf!1951 (_2!3670 lt!126081)))))))

(declare-fun lt!126082 () Bool)

(declare-fun appendBit!0 (BitStream!2684 Bool) tuple2!7066)

(assert (=> b!79207 (= lt!126081 (appendBit!0 thiss!1107 lt!126082))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79207 (= lt!126082 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79208 () Bool)

(declare-fun res!65566 () Bool)

(declare-fun e!51975 () Bool)

(assert (=> b!79208 (=> (not res!65566) (not e!51975))))

(declare-fun isPrefixOf!0 (BitStream!2684 BitStream!2684) Bool)

(assert (=> b!79208 (= res!65566 (isPrefixOf!0 thiss!1107 (_2!3670 lt!126081)))))

(declare-fun b!79209 () Bool)

(assert (=> b!79209 (= e!51976 e!51975)))

(declare-fun res!65564 () Bool)

(assert (=> b!79209 (=> (not res!65564) (not e!51975))))

(declare-fun lt!126084 () (_ BitVec 64))

(declare-fun lt!126080 () (_ BitVec 64))

(assert (=> b!79209 (= res!65564 (= lt!126084 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126080)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79209 (= lt!126084 (bitIndex!0 (size!1561 (buf!1951 (_2!3670 lt!126081))) (currentByte!3822 (_2!3670 lt!126081)) (currentBit!3817 (_2!3670 lt!126081))))))

(assert (=> b!79209 (= lt!126080 (bitIndex!0 (size!1561 (buf!1951 thiss!1107)) (currentByte!3822 thiss!1107) (currentBit!3817 thiss!1107)))))

(declare-fun res!65565 () Bool)

(assert (=> start!15652 (=> (not res!65565) (not e!51974))))

(assert (=> start!15652 (= res!65565 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15652 e!51974))

(assert (=> start!15652 true))

(declare-fun e!51977 () Bool)

(declare-fun inv!12 (BitStream!2684) Bool)

(assert (=> start!15652 (and (inv!12 thiss!1107) e!51977)))

(declare-fun b!79210 () Bool)

(declare-fun e!51973 () Bool)

(declare-datatypes ((tuple2!7068 0))(
  ( (tuple2!7069 (_1!3671 BitStream!2684) (_2!3671 Bool)) )
))
(declare-fun lt!126083 () tuple2!7068)

(assert (=> b!79210 (= e!51973 (= (bitIndex!0 (size!1561 (buf!1951 (_1!3671 lt!126083))) (currentByte!3822 (_1!3671 lt!126083)) (currentBit!3817 (_1!3671 lt!126083))) lt!126084))))

(declare-fun b!79211 () Bool)

(declare-fun array_inv!1407 (array!3380) Bool)

(assert (=> b!79211 (= e!51977 (array_inv!1407 (buf!1951 thiss!1107)))))

(declare-fun b!79212 () Bool)

(assert (=> b!79212 (= e!51975 e!51973)))

(declare-fun res!65562 () Bool)

(assert (=> b!79212 (=> (not res!65562) (not e!51973))))

(assert (=> b!79212 (= res!65562 (and (= (_2!3671 lt!126083) lt!126082) (= (_1!3671 lt!126083) (_2!3670 lt!126081))))))

(declare-fun readBitPure!0 (BitStream!2684) tuple2!7068)

(declare-fun readerFrom!0 (BitStream!2684 (_ BitVec 32) (_ BitVec 32)) BitStream!2684)

(assert (=> b!79212 (= lt!126083 (readBitPure!0 (readerFrom!0 (_2!3670 lt!126081) (currentBit!3817 thiss!1107) (currentByte!3822 thiss!1107))))))

(assert (= (and start!15652 res!65565) b!79206))

(assert (= (and b!79206 res!65563) b!79207))

(assert (= (and b!79207 res!65561) b!79209))

(assert (= (and b!79209 res!65564) b!79208))

(assert (= (and b!79208 res!65566) b!79212))

(assert (= (and b!79212 res!65562) b!79210))

(assert (= start!15652 b!79211))

(declare-fun m!124637 () Bool)

(assert (=> b!79208 m!124637))

(declare-fun m!124639 () Bool)

(assert (=> b!79207 m!124639))

(declare-fun m!124641 () Bool)

(assert (=> b!79207 m!124641))

(declare-fun m!124643 () Bool)

(assert (=> b!79209 m!124643))

(declare-fun m!124645 () Bool)

(assert (=> b!79209 m!124645))

(declare-fun m!124647 () Bool)

(assert (=> start!15652 m!124647))

(declare-fun m!124649 () Bool)

(assert (=> b!79211 m!124649))

(declare-fun m!124651 () Bool)

(assert (=> b!79206 m!124651))

(declare-fun m!124653 () Bool)

(assert (=> b!79210 m!124653))

(declare-fun m!124655 () Bool)

(assert (=> b!79212 m!124655))

(assert (=> b!79212 m!124655))

(declare-fun m!124657 () Bool)

(assert (=> b!79212 m!124657))

(push 1)

(assert (not b!79207))

(assert (not b!79206))

(assert (not b!79211))

(assert (not b!79210))

(assert (not start!15652))

(assert (not b!79209))

(assert (not b!79208))

(assert (not b!79212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


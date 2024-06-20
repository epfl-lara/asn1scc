; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4554 () Bool)

(assert start!4554)

(declare-fun b!18513 () Bool)

(declare-fun e!11832 () Bool)

(declare-datatypes ((array!1231 0))(
  ( (array!1232 (arr!959 (Array (_ BitVec 32) (_ BitVec 8))) (size!518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!906 0))(
  ( (BitStream!907 (buf!836 array!1231) (currentByte!2093 (_ BitVec 32)) (currentBit!2088 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!906)

(declare-datatypes ((tuple2!2134 0))(
  ( (tuple2!2135 (_1!1149 array!1231) (_2!1149 BitStream!906)) )
))
(declare-fun lt!26767 () tuple2!2134)

(assert (=> b!18513 (= e!11832 (not (= thiss!1917 (BitStream!907 (buf!836 (_2!1149 lt!26767)) (currentByte!2093 thiss!1917) (currentBit!2088 thiss!1917)))))))

(declare-fun e!11831 () Bool)

(assert (=> b!18513 e!11831))

(declare-fun res!16234 () Bool)

(assert (=> b!18513 (=> (not res!16234) (not e!11831))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18513 (= res!16234 (invariant!0 (currentBit!2088 (_2!1149 lt!26767)) (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767)))))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!906 (_ BitVec 64)) tuple2!2134)

(assert (=> b!18513 (= lt!26767 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!18514 () Bool)

(declare-fun e!11829 () Bool)

(declare-fun array_inv!488 (array!1231) Bool)

(assert (=> b!18514 (= e!11829 (array_inv!488 (buf!836 thiss!1917)))))

(declare-fun res!16237 () Bool)

(assert (=> start!4554 (=> (not res!16237) (not e!11832))))

(assert (=> start!4554 (= res!16237 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4554 e!11832))

(assert (=> start!4554 true))

(declare-fun inv!12 (BitStream!906) Bool)

(assert (=> start!4554 (and (inv!12 thiss!1917) e!11829)))

(declare-fun b!18515 () Bool)

(declare-fun e!11828 () Bool)

(assert (=> b!18515 (= e!11828 (invariant!0 (currentBit!2088 thiss!1917) (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767)))))))

(declare-fun b!18516 () Bool)

(declare-fun e!11827 () Bool)

(assert (=> b!18516 (= e!11831 e!11827)))

(declare-fun res!16238 () Bool)

(assert (=> b!18516 (=> res!16238 e!11827)))

(assert (=> b!18516 (= res!16238 (not (= (currentByte!2093 thiss!1917) (size!518 (buf!836 (_2!1149 lt!26767))))))))

(declare-fun b!18517 () Bool)

(declare-fun res!16236 () Bool)

(assert (=> b!18517 (=> (not res!16236) (not e!11832))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18517 (= res!16236 (validate_offset_bits!1 ((_ sign_extend 32) (size!518 (buf!836 thiss!1917))) ((_ sign_extend 32) (currentByte!2093 thiss!1917)) ((_ sign_extend 32) (currentBit!2088 thiss!1917)) nBits!604))))

(declare-fun b!18518 () Bool)

(assert (=> b!18518 (= e!11827 e!11828)))

(declare-fun res!16235 () Bool)

(assert (=> b!18518 (=> (not res!16235) (not e!11828))))

(assert (=> b!18518 (= res!16235 (and (= (currentBit!2088 (_2!1149 lt!26767)) #b00000000000000000000000000000000) (= (currentBit!2088 thiss!1917) #b00000000000000000000000000000000)))))

(assert (= (and start!4554 res!16237) b!18517))

(assert (= (and b!18517 res!16236) b!18513))

(assert (= (and b!18513 res!16234) b!18516))

(assert (= (and b!18516 (not res!16238)) b!18518))

(assert (= (and b!18518 res!16235) b!18515))

(assert (= start!4554 b!18514))

(declare-fun m!24913 () Bool)

(assert (=> b!18513 m!24913))

(declare-fun m!24915 () Bool)

(assert (=> b!18513 m!24915))

(declare-fun m!24917 () Bool)

(assert (=> b!18515 m!24917))

(declare-fun m!24919 () Bool)

(assert (=> start!4554 m!24919))

(declare-fun m!24921 () Bool)

(assert (=> b!18517 m!24921))

(declare-fun m!24923 () Bool)

(assert (=> b!18514 m!24923))

(check-sat (not b!18517) (not b!18514) (not b!18513) (not start!4554) (not b!18515))
(check-sat)
(get-model)

(declare-fun d!6122 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6122 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!518 (buf!836 thiss!1917))) ((_ sign_extend 32) (currentByte!2093 thiss!1917)) ((_ sign_extend 32) (currentBit!2088 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!518 (buf!836 thiss!1917))) ((_ sign_extend 32) (currentByte!2093 thiss!1917)) ((_ sign_extend 32) (currentBit!2088 thiss!1917))) nBits!604))))

(declare-fun bs!1725 () Bool)

(assert (= bs!1725 d!6122))

(declare-fun m!24937 () Bool)

(assert (=> bs!1725 m!24937))

(assert (=> b!18517 d!6122))

(declare-fun d!6124 () Bool)

(assert (=> d!6124 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2088 thiss!1917) (currentByte!2093 thiss!1917) (size!518 (buf!836 thiss!1917))))))

(declare-fun bs!1726 () Bool)

(assert (= bs!1726 d!6124))

(declare-fun m!24939 () Bool)

(assert (=> bs!1726 m!24939))

(assert (=> start!4554 d!6124))

(declare-fun d!6126 () Bool)

(assert (=> d!6126 (= (invariant!0 (currentBit!2088 thiss!1917) (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767)))) (and (bvsge (currentBit!2088 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2088 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2093 (_2!1149 lt!26767)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767)))) (and (= (currentBit!2088 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767))))))))))

(assert (=> b!18515 d!6126))

(declare-fun d!6128 () Bool)

(assert (=> d!6128 (= (array_inv!488 (buf!836 thiss!1917)) (bvsge (size!518 (buf!836 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18514 d!6128))

(declare-fun d!6130 () Bool)

(assert (=> d!6130 (= (invariant!0 (currentBit!2088 (_2!1149 lt!26767)) (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767)))) (and (bvsge (currentBit!2088 (_2!1149 lt!26767)) #b00000000000000000000000000000000) (bvslt (currentBit!2088 (_2!1149 lt!26767)) #b00000000000000000000000000001000) (bvsge (currentByte!2093 (_2!1149 lt!26767)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767)))) (and (= (currentBit!2088 (_2!1149 lt!26767)) #b00000000000000000000000000000000) (= (currentByte!2093 (_2!1149 lt!26767)) (size!518 (buf!836 (_2!1149 lt!26767))))))))))

(assert (=> b!18513 d!6130))

(declare-fun b!18557 () Bool)

(declare-fun res!16278 () Bool)

(declare-fun e!11857 () Bool)

(assert (=> b!18557 (=> (not res!16278) (not e!11857))))

(declare-fun lt!26809 () tuple2!2134)

(declare-fun lt!26815 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18557 (= res!16278 (= (bvadd lt!26815 nBits!604) (bitIndex!0 (size!518 (buf!836 (_2!1149 lt!26809))) (currentByte!2093 (_2!1149 lt!26809)) (currentBit!2088 (_2!1149 lt!26809)))))))

(assert (=> b!18557 (or (not (= (bvand lt!26815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26815 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18557 (= lt!26815 (bitIndex!0 (size!518 (buf!836 thiss!1917)) (currentByte!2093 thiss!1917) (currentBit!2088 thiss!1917)))))

(declare-fun b!18558 () Bool)

(declare-fun res!16277 () Bool)

(assert (=> b!18558 (=> (not res!16277) (not e!11857))))

(assert (=> b!18558 (= res!16277 (invariant!0 (currentBit!2088 (_2!1149 lt!26809)) (currentByte!2093 (_2!1149 lt!26809)) (size!518 (buf!836 (_2!1149 lt!26809)))))))

(declare-fun b!18559 () Bool)

(declare-datatypes ((List!210 0))(
  ( (Nil!207) (Cons!206 (h!325 Bool) (t!960 List!210)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!906 array!1231 (_ BitVec 64) (_ BitVec 64)) List!210)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!906 BitStream!906 (_ BitVec 64)) List!210)

(assert (=> b!18559 (= e!11857 (= (byteArrayBitContentToList!0 (_2!1149 lt!26809) (_1!1149 lt!26809) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1149 lt!26809) thiss!1917 nBits!604)))))

(declare-fun d!6132 () Bool)

(assert (=> d!6132 e!11857))

(declare-fun res!16279 () Bool)

(assert (=> d!6132 (=> (not res!16279) (not e!11857))))

(assert (=> d!6132 (= res!16279 (= (buf!836 (_2!1149 lt!26809)) (buf!836 thiss!1917)))))

(declare-datatypes ((Unit!1638 0))(
  ( (Unit!1639) )
))
(declare-datatypes ((tuple3!152 0))(
  ( (tuple3!153 (_1!1151 Unit!1638) (_2!1151 BitStream!906) (_3!82 array!1231)) )
))
(declare-fun lt!26816 () tuple3!152)

(assert (=> d!6132 (= lt!26809 (tuple2!2135 (_3!82 lt!26816) (_2!1151 lt!26816)))))

(declare-fun readBitsLoop!0 (BitStream!906 (_ BitVec 64) array!1231 (_ BitVec 64) (_ BitVec 64)) tuple3!152)

(assert (=> d!6132 (= lt!26816 (readBitsLoop!0 thiss!1917 nBits!604 (array!1232 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6132 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6132 (= (readBits!0 thiss!1917 nBits!604) lt!26809)))

(declare-fun b!18560 () Bool)

(declare-fun res!16280 () Bool)

(assert (=> b!18560 (=> (not res!16280) (not e!11857))))

(declare-fun lt!26817 () (_ BitVec 64))

(assert (=> b!18560 (= res!16280 (= (size!518 (_1!1149 lt!26809)) ((_ extract 31 0) lt!26817)))))

(assert (=> b!18560 (and (bvslt lt!26817 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26817 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26810 () (_ BitVec 64))

(declare-fun lt!26813 () (_ BitVec 64))

(assert (=> b!18560 (= lt!26817 (bvsdiv lt!26810 lt!26813))))

(assert (=> b!18560 (and (not (= lt!26813 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26810 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26813 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18560 (= lt!26813 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26812 () (_ BitVec 64))

(declare-fun lt!26814 () (_ BitVec 64))

(assert (=> b!18560 (= lt!26810 (bvsub lt!26812 lt!26814))))

(assert (=> b!18560 (or (= (bvand lt!26812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26812 lt!26814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18560 (= lt!26814 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26811 () (_ BitVec 64))

(assert (=> b!18560 (= lt!26812 (bvadd nBits!604 lt!26811))))

(assert (=> b!18560 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26811 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18560 (= lt!26811 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18561 () Bool)

(declare-fun res!16276 () Bool)

(assert (=> b!18561 (=> (not res!16276) (not e!11857))))

(assert (=> b!18561 (= res!16276 (bvsle (currentByte!2093 thiss!1917) (currentByte!2093 (_2!1149 lt!26809))))))

(assert (= (and d!6132 res!16279) b!18557))

(assert (= (and b!18557 res!16278) b!18558))

(assert (= (and b!18558 res!16277) b!18560))

(assert (= (and b!18560 res!16280) b!18561))

(assert (= (and b!18561 res!16276) b!18559))

(declare-fun m!24947 () Bool)

(assert (=> b!18557 m!24947))

(declare-fun m!24949 () Bool)

(assert (=> b!18557 m!24949))

(declare-fun m!24951 () Bool)

(assert (=> b!18558 m!24951))

(declare-fun m!24953 () Bool)

(assert (=> b!18559 m!24953))

(declare-fun m!24955 () Bool)

(assert (=> b!18559 m!24955))

(declare-fun m!24957 () Bool)

(assert (=> d!6132 m!24957))

(assert (=> b!18513 d!6132))

(check-sat (not b!18557) (not d!6124) (not b!18559) (not d!6132) (not d!6122) (not b!18558))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4378 () Bool)

(assert start!4378)

(declare-fun b!17960 () Bool)

(declare-fun e!11506 () Bool)

(declare-datatypes ((array!1193 0))(
  ( (array!1194 (arr!940 (Array (_ BitVec 32) (_ BitVec 8))) (size!505 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!880 0))(
  ( (BitStream!881 (buf!823 array!1193) (currentByte!2050 (_ BitVec 32)) (currentBit!2045 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2090 0))(
  ( (tuple2!2091 (_1!1115 array!1193) (_2!1115 BitStream!880)) )
))
(declare-fun lt!25981 () tuple2!2090)

(declare-fun thiss!1917 () BitStream!880)

(declare-fun inv!12 (BitStream!880) Bool)

(assert (=> b!17960 (= e!11506 (inv!12 (BitStream!881 (buf!823 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (currentBit!2045 thiss!1917))))))

(declare-fun b!17961 () Bool)

(declare-fun e!11507 () Bool)

(assert (=> b!17961 (= e!11507 (not e!11506))))

(declare-fun res!15794 () Bool)

(assert (=> b!17961 (=> res!15794 e!11506)))

(assert (=> b!17961 (= res!15794 (not (= (currentByte!2050 thiss!1917) (size!505 (buf!823 (_2!1115 lt!25981))))))))

(declare-fun e!11502 () Bool)

(assert (=> b!17961 e!11502))

(declare-fun res!15793 () Bool)

(assert (=> b!17961 (=> (not res!15793) (not e!11502))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17961 (= res!15793 (invariant!0 (currentBit!2045 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981)))))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!880 (_ BitVec 64)) tuple2!2090)

(assert (=> b!17961 (= lt!25981 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17962 () Bool)

(declare-fun e!11508 () Bool)

(declare-fun array_inv!475 (array!1193) Bool)

(assert (=> b!17962 (= e!11508 (array_inv!475 (buf!823 thiss!1917)))))

(declare-fun res!15792 () Bool)

(assert (=> start!4378 (=> (not res!15792) (not e!11507))))

(assert (=> start!4378 (= res!15792 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4378 e!11507))

(assert (=> start!4378 true))

(assert (=> start!4378 (and (inv!12 thiss!1917) e!11508)))

(declare-fun b!17963 () Bool)

(declare-fun e!11504 () Bool)

(declare-fun e!11505 () Bool)

(assert (=> b!17963 (= e!11504 e!11505)))

(declare-fun res!15796 () Bool)

(assert (=> b!17963 (=> (not res!15796) (not e!11505))))

(assert (=> b!17963 (= res!15796 (and (= (currentBit!2045 (_2!1115 lt!25981)) #b00000000000000000000000000000000) (= (currentBit!2045 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!17964 () Bool)

(assert (=> b!17964 (= e!11505 (invariant!0 (currentBit!2045 thiss!1917) (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981)))))))

(declare-fun b!17965 () Bool)

(assert (=> b!17965 (= e!11502 e!11504)))

(declare-fun res!15797 () Bool)

(assert (=> b!17965 (=> res!15797 e!11504)))

(assert (=> b!17965 (= res!15797 (not (= (currentByte!2050 thiss!1917) (size!505 (buf!823 (_2!1115 lt!25981))))))))

(declare-fun b!17966 () Bool)

(declare-fun res!15795 () Bool)

(assert (=> b!17966 (=> (not res!15795) (not e!11507))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17966 (= res!15795 (validate_offset_bits!1 ((_ sign_extend 32) (size!505 (buf!823 thiss!1917))) ((_ sign_extend 32) (currentByte!2050 thiss!1917)) ((_ sign_extend 32) (currentBit!2045 thiss!1917)) nBits!604))))

(assert (= (and start!4378 res!15792) b!17966))

(assert (= (and b!17966 res!15795) b!17961))

(assert (= (and b!17961 res!15793) b!17965))

(assert (= (and b!17965 (not res!15797)) b!17963))

(assert (= (and b!17963 res!15796) b!17964))

(assert (= (and b!17961 (not res!15794)) b!17960))

(assert (= start!4378 b!17962))

(declare-fun m!24319 () Bool)

(assert (=> b!17960 m!24319))

(declare-fun m!24321 () Bool)

(assert (=> b!17964 m!24321))

(declare-fun m!24323 () Bool)

(assert (=> b!17966 m!24323))

(declare-fun m!24325 () Bool)

(assert (=> b!17962 m!24325))

(declare-fun m!24327 () Bool)

(assert (=> start!4378 m!24327))

(declare-fun m!24329 () Bool)

(assert (=> b!17961 m!24329))

(declare-fun m!24331 () Bool)

(assert (=> b!17961 m!24331))

(push 1)

(assert (not b!17960))

(assert (not b!17962))

(assert (not b!17966))

(assert (not start!4378))

(assert (not b!17964))

(assert (not b!17961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5904 () Bool)

(assert (=> d!5904 (= (invariant!0 (currentBit!2045 thiss!1917) (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981)))) (and (bvsge (currentBit!2045 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2045 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2050 (_2!1115 lt!25981)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981)))) (and (= (currentBit!2045 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981))))))))))

(assert (=> b!17964 d!5904))

(declare-fun d!5906 () Bool)

(assert (=> d!5906 (= (inv!12 (BitStream!881 (buf!823 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (currentBit!2045 thiss!1917))) (invariant!0 (currentBit!2045 (BitStream!881 (buf!823 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (currentBit!2045 thiss!1917))) (currentByte!2050 (BitStream!881 (buf!823 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (currentBit!2045 thiss!1917))) (size!505 (buf!823 (BitStream!881 (buf!823 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (currentBit!2045 thiss!1917))))))))

(declare-fun bs!1677 () Bool)

(assert (= bs!1677 d!5906))

(declare-fun m!24361 () Bool)

(assert (=> bs!1677 m!24361))

(assert (=> b!17960 d!5906))

(declare-fun d!5910 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!505 (buf!823 thiss!1917))) ((_ sign_extend 32) (currentByte!2050 thiss!1917)) ((_ sign_extend 32) (currentBit!2045 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!505 (buf!823 thiss!1917))) ((_ sign_extend 32) (currentByte!2050 thiss!1917)) ((_ sign_extend 32) (currentBit!2045 thiss!1917))) nBits!604))))

(declare-fun bs!1678 () Bool)

(assert (= bs!1678 d!5910))

(declare-fun m!24363 () Bool)

(assert (=> bs!1678 m!24363))

(assert (=> b!17966 d!5910))

(declare-fun d!5914 () Bool)

(assert (=> d!5914 (= (invariant!0 (currentBit!2045 (_2!1115 lt!25981)) (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981)))) (and (bvsge (currentBit!2045 (_2!1115 lt!25981)) #b00000000000000000000000000000000) (bvslt (currentBit!2045 (_2!1115 lt!25981)) #b00000000000000000000000000001000) (bvsge (currentByte!2050 (_2!1115 lt!25981)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981)))) (and (= (currentBit!2045 (_2!1115 lt!25981)) #b00000000000000000000000000000000) (= (currentByte!2050 (_2!1115 lt!25981)) (size!505 (buf!823 (_2!1115 lt!25981))))))))))

(assert (=> b!17961 d!5914))

(declare-fun b!18049 () Bool)

(declare-fun res!15878 () Bool)

(declare-fun e!11559 () Bool)

(assert (=> b!18049 (=> (not res!15878) (not e!11559))))

(declare-fun lt!26065 () (_ BitVec 64))

(declare-fun lt!26061 () tuple2!2090)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18049 (= res!15878 (= (bvadd lt!26065 nBits!604) (bitIndex!0 (size!505 (buf!823 (_2!1115 lt!26061))) (currentByte!2050 (_2!1115 lt!26061)) (currentBit!2045 (_2!1115 lt!26061)))))))

(assert (=> b!18049 (or (not (= (bvand lt!26065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26065 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18049 (= lt!26065 (bitIndex!0 (size!505 (buf!823 thiss!1917)) (currentByte!2050 thiss!1917) (currentBit!2045 thiss!1917)))))

(declare-fun d!5918 () Bool)

(assert (=> d!5918 e!11559))

(declare-fun res!15874 () Bool)

(assert (=> d!5918 (=> (not res!15874) (not e!11559))))

(assert (=> d!5918 (= res!15874 (= (buf!823 (_2!1115 lt!26061)) (buf!823 thiss!1917)))))

(declare-datatypes ((Unit!1604 0))(
  ( (Unit!1605) )
))
(declare-datatypes ((tuple3!130 0))(
  ( (tuple3!131 (_1!1119 Unit!1604) (_2!1119 BitStream!880) (_3!71 array!1193)) )
))
(declare-fun lt!26067 () tuple3!130)

(assert (=> d!5918 (= lt!26061 (tuple2!2091 (_3!71 lt!26067) (_2!1119 lt!26067)))))

(declare-fun readBitsLoop!0 (BitStream!880 (_ BitVec 64) array!1193 (_ BitVec 64) (_ BitVec 64)) tuple3!130)

(assert (=> d!5918 (= lt!26067 (readBitsLoop!0 thiss!1917 nBits!604 (array!1194 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5918 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5918 (= (readBits!0 thiss!1917 nBits!604) lt!26061)))

(declare-fun b!18050 () Bool)

(declare-fun res!15877 () Bool)

(assert (=> b!18050 (=> (not res!15877) (not e!11559))))

(assert (=> b!18050 (= res!15877 (bvsle (currentByte!2050 thiss!1917) (currentByte!2050 (_2!1115 lt!26061))))))

(declare-fun b!18051 () Bool)

(declare-fun res!15876 () Bool)

(assert (=> b!18051 (=> (not res!15876) (not e!11559))))

(assert (=> b!18051 (= res!15876 (invariant!0 (currentBit!2045 (_2!1115 lt!26061)) (currentByte!2050 (_2!1115 lt!26061)) (size!505 (buf!823 (_2!1115 lt!26061)))))))

(declare-fun b!18052 () Bool)

(declare-fun res!15875 () Bool)

(assert (=> b!18052 (=> (not res!15875) (not e!11559))))

(declare-fun lt!26068 () (_ BitVec 64))

(assert (=> b!18052 (= res!15875 (= (size!505 (_1!1115 lt!26061)) ((_ extract 31 0) lt!26068)))))

(assert (=> b!18052 (and (bvslt lt!26068 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26068 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26060 () (_ BitVec 64))

(declare-fun lt!26062 () (_ BitVec 64))

(assert (=> b!18052 (= lt!26068 (bvsdiv lt!26060 lt!26062))))

(assert (=> b!18052 (and (not (= lt!26062 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26060 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26062 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18052 (= lt!26062 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26063 () (_ BitVec 64))

(declare-fun lt!26066 () (_ BitVec 64))

(assert (=> b!18052 (= lt!26060 (bvsub lt!26063 lt!26066))))

(assert (=> b!18052 (or (= (bvand lt!26063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26066 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26063 lt!26066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18052 (= lt!26066 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26064 () (_ BitVec 64))

(assert (=> b!18052 (= lt!26063 (bvadd nBits!604 lt!26064))))

(assert (=> b!18052 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26064 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18052 (= lt!26064 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18053 () Bool)

(declare-datatypes ((List!200 0))(
  ( (Nil!197) (Cons!196 (h!315 Bool) (t!950 List!200)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!880 array!1193 (_ BitVec 64) (_ BitVec 64)) List!200)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!880 BitStream!880 (_ BitVec 64)) List!200)

(assert (=> b!18053 (= e!11559 (= (byteArrayBitContentToList!0 (_2!1115 lt!26061) (_1!1115 lt!26061) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1115 lt!26061) thiss!1917 nBits!604)))))

(assert (= (and d!5918 res!15874) b!18049))

(assert (= (and b!18049 res!15878) b!18051))

(assert (= (and b!18051 res!15876) b!18052))

(assert (= (and b!18052 res!15875) b!18050))

(assert (= (and b!18050 res!15877) b!18053))

(declare-fun m!24397 () Bool)

(assert (=> b!18049 m!24397))

(declare-fun m!24399 () Bool)

(assert (=> b!18049 m!24399))

(declare-fun m!24401 () Bool)

(assert (=> d!5918 m!24401))

(declare-fun m!24403 () Bool)

(assert (=> b!18051 m!24403))

(declare-fun m!24405 () Bool)

(assert (=> b!18053 m!24405))

(declare-fun m!24407 () Bool)

(assert (=> b!18053 m!24407))

(assert (=> b!17961 d!5918))

(declare-fun d!5938 () Bool)

(assert (=> d!5938 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2045 thiss!1917) (currentByte!2050 thiss!1917) (size!505 (buf!823 thiss!1917))))))

(declare-fun bs!1684 () Bool)

(assert (= bs!1684 d!5938))

(declare-fun m!24411 () Bool)

(assert (=> bs!1684 m!24411))

(assert (=> start!4378 d!5938))

(declare-fun d!5942 () Bool)

(assert (=> d!5942 (= (array_inv!475 (buf!823 thiss!1917)) (bvsge (size!505 (buf!823 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17962 d!5942))

(push 1)

(assert (not d!5906))

(assert (not d!5910))

(assert (not b!18053))

(assert (not b!18051))

(assert (not d!5918))

(assert (not d!5938))

(assert (not b!18049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


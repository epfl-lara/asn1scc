; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4380 () Bool)

(assert start!4380)

(declare-fun b!17981 () Bool)

(declare-fun e!11528 () Bool)

(declare-fun e!11525 () Bool)

(assert (=> b!17981 (= e!11528 e!11525)))

(declare-fun res!15810 () Bool)

(assert (=> b!17981 (=> (not res!15810) (not e!11525))))

(declare-datatypes ((array!1195 0))(
  ( (array!1196 (arr!941 (Array (_ BitVec 32) (_ BitVec 8))) (size!506 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!882 0))(
  ( (BitStream!883 (buf!824 array!1195) (currentByte!2051 (_ BitVec 32)) (currentBit!2046 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2092 0))(
  ( (tuple2!2093 (_1!1116 array!1195) (_2!1116 BitStream!882)) )
))
(declare-fun lt!25984 () tuple2!2092)

(declare-fun thiss!1917 () BitStream!882)

(assert (=> b!17981 (= res!15810 (and (= (currentBit!2046 (_2!1116 lt!25984)) #b00000000000000000000000000000000) (= (currentBit!2046 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!17982 () Bool)

(declare-fun res!15814 () Bool)

(declare-fun e!11523 () Bool)

(assert (=> b!17982 (=> (not res!15814) (not e!11523))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17982 (= res!15814 (validate_offset_bits!1 ((_ sign_extend 32) (size!506 (buf!824 thiss!1917))) ((_ sign_extend 32) (currentByte!2051 thiss!1917)) ((_ sign_extend 32) (currentBit!2046 thiss!1917)) nBits!604))))

(declare-fun b!17983 () Bool)

(declare-fun e!11526 () Bool)

(declare-fun array_inv!476 (array!1195) Bool)

(assert (=> b!17983 (= e!11526 (array_inv!476 (buf!824 thiss!1917)))))

(declare-fun b!17984 () Bool)

(declare-fun e!11524 () Bool)

(assert (=> b!17984 (= e!11524 e!11528)))

(declare-fun res!15811 () Bool)

(assert (=> b!17984 (=> res!15811 e!11528)))

(assert (=> b!17984 (= res!15811 (not (= (currentByte!2051 thiss!1917) (size!506 (buf!824 (_2!1116 lt!25984))))))))

(declare-fun b!17985 () Bool)

(declare-fun e!11529 () Bool)

(declare-fun inv!12 (BitStream!882) Bool)

(assert (=> b!17985 (= e!11529 (inv!12 (BitStream!883 (buf!824 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (currentBit!2046 thiss!1917))))))

(declare-fun res!15812 () Bool)

(assert (=> start!4380 (=> (not res!15812) (not e!11523))))

(assert (=> start!4380 (= res!15812 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4380 e!11523))

(assert (=> start!4380 true))

(assert (=> start!4380 (and (inv!12 thiss!1917) e!11526)))

(declare-fun b!17986 () Bool)

(assert (=> b!17986 (= e!11523 (not e!11529))))

(declare-fun res!15815 () Bool)

(assert (=> b!17986 (=> res!15815 e!11529)))

(assert (=> b!17986 (= res!15815 (not (= (currentByte!2051 thiss!1917) (size!506 (buf!824 (_2!1116 lt!25984))))))))

(assert (=> b!17986 e!11524))

(declare-fun res!15813 () Bool)

(assert (=> b!17986 (=> (not res!15813) (not e!11524))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17986 (= res!15813 (invariant!0 (currentBit!2046 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984)))))))

(declare-fun readBits!0 (BitStream!882 (_ BitVec 64)) tuple2!2092)

(assert (=> b!17986 (= lt!25984 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17987 () Bool)

(assert (=> b!17987 (= e!11525 (invariant!0 (currentBit!2046 thiss!1917) (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984)))))))

(assert (= (and start!4380 res!15812) b!17982))

(assert (= (and b!17982 res!15814) b!17986))

(assert (= (and b!17986 res!15813) b!17984))

(assert (= (and b!17984 (not res!15811)) b!17981))

(assert (= (and b!17981 res!15810) b!17987))

(assert (= (and b!17986 (not res!15815)) b!17985))

(assert (= start!4380 b!17983))

(declare-fun m!24333 () Bool)

(assert (=> b!17983 m!24333))

(declare-fun m!24335 () Bool)

(assert (=> b!17986 m!24335))

(declare-fun m!24337 () Bool)

(assert (=> b!17986 m!24337))

(declare-fun m!24339 () Bool)

(assert (=> b!17982 m!24339))

(declare-fun m!24341 () Bool)

(assert (=> b!17985 m!24341))

(declare-fun m!24343 () Bool)

(assert (=> start!4380 m!24343))

(declare-fun m!24345 () Bool)

(assert (=> b!17987 m!24345))

(check-sat (not b!17987) (not b!17985) (not b!17983) (not b!17986) (not b!17982) (not start!4380))
(check-sat)
(get-model)

(declare-fun d!5908 () Bool)

(assert (=> d!5908 (= (invariant!0 (currentBit!2046 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984)))) (and (bvsge (currentBit!2046 (_2!1116 lt!25984)) #b00000000000000000000000000000000) (bvslt (currentBit!2046 (_2!1116 lt!25984)) #b00000000000000000000000000001000) (bvsge (currentByte!2051 (_2!1116 lt!25984)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984)))) (and (= (currentBit!2046 (_2!1116 lt!25984)) #b00000000000000000000000000000000) (= (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984))))))))))

(assert (=> b!17986 d!5908))

(declare-fun b!18039 () Bool)

(declare-fun res!15866 () Bool)

(declare-fun e!11557 () Bool)

(assert (=> b!18039 (=> (not res!15866) (not e!11557))))

(declare-fun lt!26047 () tuple2!2092)

(declare-fun lt!26043 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18039 (= res!15866 (= (bvadd lt!26043 nBits!604) (bitIndex!0 (size!506 (buf!824 (_2!1116 lt!26047))) (currentByte!2051 (_2!1116 lt!26047)) (currentBit!2046 (_2!1116 lt!26047)))))))

(assert (=> b!18039 (or (not (= (bvand lt!26043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26043 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18039 (= lt!26043 (bitIndex!0 (size!506 (buf!824 thiss!1917)) (currentByte!2051 thiss!1917) (currentBit!2046 thiss!1917)))))

(declare-fun b!18040 () Bool)

(declare-fun res!15865 () Bool)

(assert (=> b!18040 (=> (not res!15865) (not e!11557))))

(declare-fun lt!26044 () (_ BitVec 64))

(assert (=> b!18040 (= res!15865 (= (size!506 (_1!1116 lt!26047)) ((_ extract 31 0) lt!26044)))))

(assert (=> b!18040 (and (bvslt lt!26044 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26044 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26046 () (_ BitVec 64))

(declare-fun lt!26045 () (_ BitVec 64))

(assert (=> b!18040 (= lt!26044 (bvsdiv lt!26046 lt!26045))))

(assert (=> b!18040 (and (not (= lt!26045 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26046 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26045 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18040 (= lt!26045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26042 () (_ BitVec 64))

(declare-fun lt!26050 () (_ BitVec 64))

(assert (=> b!18040 (= lt!26046 (bvsub lt!26042 lt!26050))))

(assert (=> b!18040 (or (= (bvand lt!26042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26050 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26042 lt!26050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18040 (= lt!26050 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26049 () (_ BitVec 64))

(assert (=> b!18040 (= lt!26042 (bvadd nBits!604 lt!26049))))

(assert (=> b!18040 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26049 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18040 (= lt!26049 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!5916 () Bool)

(assert (=> d!5916 e!11557))

(declare-fun res!15868 () Bool)

(assert (=> d!5916 (=> (not res!15868) (not e!11557))))

(assert (=> d!5916 (= res!15868 (= (buf!824 (_2!1116 lt!26047)) (buf!824 thiss!1917)))))

(declare-datatypes ((Unit!1602 0))(
  ( (Unit!1603) )
))
(declare-datatypes ((tuple3!128 0))(
  ( (tuple3!129 (_1!1118 Unit!1602) (_2!1118 BitStream!882) (_3!70 array!1195)) )
))
(declare-fun lt!26048 () tuple3!128)

(assert (=> d!5916 (= lt!26047 (tuple2!2093 (_3!70 lt!26048) (_2!1118 lt!26048)))))

(declare-fun readBitsLoop!0 (BitStream!882 (_ BitVec 64) array!1195 (_ BitVec 64) (_ BitVec 64)) tuple3!128)

(assert (=> d!5916 (= lt!26048 (readBitsLoop!0 thiss!1917 nBits!604 (array!1196 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5916 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5916 (= (readBits!0 thiss!1917 nBits!604) lt!26047)))

(declare-fun b!18041 () Bool)

(declare-datatypes ((List!199 0))(
  ( (Nil!196) (Cons!195 (h!314 Bool) (t!949 List!199)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!882 array!1195 (_ BitVec 64) (_ BitVec 64)) List!199)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!882 BitStream!882 (_ BitVec 64)) List!199)

(assert (=> b!18041 (= e!11557 (= (byteArrayBitContentToList!0 (_2!1116 lt!26047) (_1!1116 lt!26047) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1116 lt!26047) thiss!1917 nBits!604)))))

(declare-fun b!18042 () Bool)

(declare-fun res!15864 () Bool)

(assert (=> b!18042 (=> (not res!15864) (not e!11557))))

(assert (=> b!18042 (= res!15864 (invariant!0 (currentBit!2046 (_2!1116 lt!26047)) (currentByte!2051 (_2!1116 lt!26047)) (size!506 (buf!824 (_2!1116 lt!26047)))))))

(declare-fun b!18043 () Bool)

(declare-fun res!15867 () Bool)

(assert (=> b!18043 (=> (not res!15867) (not e!11557))))

(assert (=> b!18043 (= res!15867 (bvsle (currentByte!2051 thiss!1917) (currentByte!2051 (_2!1116 lt!26047))))))

(assert (= (and d!5916 res!15868) b!18039))

(assert (= (and b!18039 res!15866) b!18042))

(assert (= (and b!18042 res!15864) b!18040))

(assert (= (and b!18040 res!15865) b!18043))

(assert (= (and b!18043 res!15867) b!18041))

(declare-fun m!24369 () Bool)

(assert (=> b!18039 m!24369))

(declare-fun m!24371 () Bool)

(assert (=> b!18039 m!24371))

(declare-fun m!24373 () Bool)

(assert (=> d!5916 m!24373))

(declare-fun m!24375 () Bool)

(assert (=> b!18041 m!24375))

(declare-fun m!24377 () Bool)

(assert (=> b!18041 m!24377))

(declare-fun m!24379 () Bool)

(assert (=> b!18042 m!24379))

(assert (=> b!17986 d!5916))

(declare-fun d!5928 () Bool)

(assert (=> d!5928 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2046 thiss!1917) (currentByte!2051 thiss!1917) (size!506 (buf!824 thiss!1917))))))

(declare-fun bs!1681 () Bool)

(assert (= bs!1681 d!5928))

(declare-fun m!24381 () Bool)

(assert (=> bs!1681 m!24381))

(assert (=> start!4380 d!5928))

(declare-fun d!5930 () Bool)

(assert (=> d!5930 (= (inv!12 (BitStream!883 (buf!824 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (currentBit!2046 thiss!1917))) (invariant!0 (currentBit!2046 (BitStream!883 (buf!824 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (currentBit!2046 thiss!1917))) (currentByte!2051 (BitStream!883 (buf!824 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (currentBit!2046 thiss!1917))) (size!506 (buf!824 (BitStream!883 (buf!824 (_2!1116 lt!25984)) (currentByte!2051 (_2!1116 lt!25984)) (currentBit!2046 thiss!1917))))))))

(declare-fun bs!1682 () Bool)

(assert (= bs!1682 d!5930))

(declare-fun m!24383 () Bool)

(assert (=> bs!1682 m!24383))

(assert (=> b!17985 d!5930))

(declare-fun d!5932 () Bool)

(assert (=> d!5932 (= (array_inv!476 (buf!824 thiss!1917)) (bvsge (size!506 (buf!824 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17983 d!5932))

(declare-fun d!5934 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5934 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!506 (buf!824 thiss!1917))) ((_ sign_extend 32) (currentByte!2051 thiss!1917)) ((_ sign_extend 32) (currentBit!2046 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!506 (buf!824 thiss!1917))) ((_ sign_extend 32) (currentByte!2051 thiss!1917)) ((_ sign_extend 32) (currentBit!2046 thiss!1917))) nBits!604))))

(declare-fun bs!1683 () Bool)

(assert (= bs!1683 d!5934))

(declare-fun m!24409 () Bool)

(assert (=> bs!1683 m!24409))

(assert (=> b!17982 d!5934))

(declare-fun d!5940 () Bool)

(assert (=> d!5940 (= (invariant!0 (currentBit!2046 thiss!1917) (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984)))) (and (bvsge (currentBit!2046 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2046 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2051 (_2!1116 lt!25984)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984)))) (and (= (currentBit!2046 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2051 (_2!1116 lt!25984)) (size!506 (buf!824 (_2!1116 lt!25984))))))))))

(assert (=> b!17987 d!5940))

(check-sat (not b!18042) (not d!5928) (not d!5916) (not b!18039) (not b!18041) (not d!5934) (not d!5930))

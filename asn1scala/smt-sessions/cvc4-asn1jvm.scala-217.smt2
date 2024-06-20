; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4418 () Bool)

(assert start!4418)

(declare-fun b!18110 () Bool)

(declare-fun e!11620 () Bool)

(declare-fun e!11622 () Bool)

(assert (=> b!18110 (= e!11620 (not e!11622))))

(declare-fun res!15932 () Bool)

(assert (=> b!18110 (=> res!15932 e!11622)))

(declare-datatypes ((array!1206 0))(
  ( (array!1207 (arr!945 (Array (_ BitVec 32) (_ BitVec 8))) (size!510 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!890 0))(
  ( (BitStream!891 (buf!828 array!1206) (currentByte!2061 (_ BitVec 32)) (currentBit!2056 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!890)

(declare-datatypes ((tuple2!2100 0))(
  ( (tuple2!2101 (_1!1123 array!1206) (_2!1123 BitStream!890)) )
))
(declare-fun lt!26077 () tuple2!2100)

(assert (=> b!18110 (= res!15932 (not (= (currentByte!2061 thiss!1917) (size!510 (buf!828 (_2!1123 lt!26077))))))))

(declare-fun e!11619 () Bool)

(assert (=> b!18110 e!11619))

(declare-fun res!15930 () Bool)

(assert (=> b!18110 (=> (not res!15930) (not e!11619))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18110 (= res!15930 (invariant!0 (currentBit!2056 (_2!1123 lt!26077)) (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077)))))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!890 (_ BitVec 64)) tuple2!2100)

(assert (=> b!18110 (= lt!26077 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!18111 () Bool)

(declare-fun e!11617 () Bool)

(assert (=> b!18111 (= e!11619 e!11617)))

(declare-fun res!15927 () Bool)

(assert (=> b!18111 (=> res!15927 e!11617)))

(assert (=> b!18111 (= res!15927 (not (= (currentByte!2061 thiss!1917) (size!510 (buf!828 (_2!1123 lt!26077))))))))

(declare-fun b!18112 () Bool)

(declare-fun res!15928 () Bool)

(assert (=> b!18112 (=> (not res!15928) (not e!11620))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18112 (= res!15928 (validate_offset_bits!1 ((_ sign_extend 32) (size!510 (buf!828 thiss!1917))) ((_ sign_extend 32) (currentByte!2061 thiss!1917)) ((_ sign_extend 32) (currentBit!2056 thiss!1917)) nBits!604))))

(declare-fun b!18113 () Bool)

(declare-fun inv!12 (BitStream!890) Bool)

(assert (=> b!18113 (= e!11622 (inv!12 (BitStream!891 (buf!828 (_2!1123 lt!26077)) (currentByte!2061 thiss!1917) (currentBit!2056 thiss!1917))))))

(declare-fun b!18114 () Bool)

(declare-fun e!11618 () Bool)

(declare-fun array_inv!480 (array!1206) Bool)

(assert (=> b!18114 (= e!11618 (array_inv!480 (buf!828 thiss!1917)))))

(declare-fun res!15929 () Bool)

(assert (=> start!4418 (=> (not res!15929) (not e!11620))))

(assert (=> start!4418 (= res!15929 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4418 e!11620))

(assert (=> start!4418 true))

(assert (=> start!4418 (and (inv!12 thiss!1917) e!11618)))

(declare-fun b!18115 () Bool)

(declare-fun e!11616 () Bool)

(assert (=> b!18115 (= e!11617 e!11616)))

(declare-fun res!15931 () Bool)

(assert (=> b!18115 (=> (not res!15931) (not e!11616))))

(assert (=> b!18115 (= res!15931 (and (= (currentBit!2056 (_2!1123 lt!26077)) #b00000000000000000000000000000000) (= (currentBit!2056 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!18116 () Bool)

(assert (=> b!18116 (= e!11616 (invariant!0 (currentBit!2056 thiss!1917) (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077)))))))

(assert (= (and start!4418 res!15929) b!18112))

(assert (= (and b!18112 res!15928) b!18110))

(assert (= (and b!18110 res!15930) b!18111))

(assert (= (and b!18111 (not res!15927)) b!18115))

(assert (= (and b!18115 res!15931) b!18116))

(assert (= (and b!18110 (not res!15932)) b!18113))

(assert (= start!4418 b!18114))

(declare-fun m!24443 () Bool)

(assert (=> b!18113 m!24443))

(declare-fun m!24445 () Bool)

(assert (=> start!4418 m!24445))

(declare-fun m!24447 () Bool)

(assert (=> b!18110 m!24447))

(declare-fun m!24449 () Bool)

(assert (=> b!18110 m!24449))

(declare-fun m!24451 () Bool)

(assert (=> b!18112 m!24451))

(declare-fun m!24453 () Bool)

(assert (=> b!18114 m!24453))

(declare-fun m!24455 () Bool)

(assert (=> b!18116 m!24455))

(push 1)

(assert (not b!18114))

(assert (not start!4418))

(assert (not b!18113))

(assert (not b!18112))

(assert (not b!18116))

(assert (not b!18110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5958 () Bool)

(assert (=> d!5958 (= (invariant!0 (currentBit!2056 thiss!1917) (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077)))) (and (bvsge (currentBit!2056 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2056 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2061 (_2!1123 lt!26077)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077)))) (and (= (currentBit!2056 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077))))))))))

(assert (=> b!18116 d!5958))

(declare-fun d!5962 () Bool)

(assert (=> d!5962 (= (invariant!0 (currentBit!2056 (_2!1123 lt!26077)) (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077)))) (and (bvsge (currentBit!2056 (_2!1123 lt!26077)) #b00000000000000000000000000000000) (bvslt (currentBit!2056 (_2!1123 lt!26077)) #b00000000000000000000000000001000) (bvsge (currentByte!2061 (_2!1123 lt!26077)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077)))) (and (= (currentBit!2056 (_2!1123 lt!26077)) #b00000000000000000000000000000000) (= (currentByte!2061 (_2!1123 lt!26077)) (size!510 (buf!828 (_2!1123 lt!26077))))))))))

(assert (=> b!18110 d!5962))

(declare-fun b!18157 () Bool)

(declare-fun res!15974 () Bool)

(declare-fun e!11631 () Bool)

(assert (=> b!18157 (=> (not res!15974) (not e!11631))))

(declare-fun lt!26152 () tuple2!2100)

(assert (=> b!18157 (= res!15974 (invariant!0 (currentBit!2056 (_2!1123 lt!26152)) (currentByte!2061 (_2!1123 lt!26152)) (size!510 (buf!828 (_2!1123 lt!26152)))))))

(declare-fun b!18158 () Bool)

(declare-fun res!15976 () Bool)

(assert (=> b!18158 (=> (not res!15976) (not e!11631))))

(declare-fun lt!26156 () (_ BitVec 64))

(assert (=> b!18158 (= res!15976 (= (size!510 (_1!1123 lt!26152)) ((_ extract 31 0) lt!26156)))))

(assert (=> b!18158 (and (bvslt lt!26156 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26156 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26153 () (_ BitVec 64))

(declare-fun lt!26157 () (_ BitVec 64))

(assert (=> b!18158 (= lt!26156 (bvsdiv lt!26153 lt!26157))))

(assert (=> b!18158 (and (not (= lt!26157 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26153 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26157 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18158 (= lt!26157 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26154 () (_ BitVec 64))

(declare-fun lt!26158 () (_ BitVec 64))

(assert (=> b!18158 (= lt!26153 (bvsub lt!26154 lt!26158))))

(assert (=> b!18158 (or (= (bvand lt!26154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26158 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26154 lt!26158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18158 (= lt!26158 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26151 () (_ BitVec 64))

(assert (=> b!18158 (= lt!26154 (bvadd nBits!604 lt!26151))))

(assert (=> b!18158 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26151 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18158 (= lt!26151 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18159 () Bool)

(declare-datatypes ((List!203 0))(
  ( (Nil!200) (Cons!199 (h!318 Bool) (t!953 List!203)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!890 array!1206 (_ BitVec 64) (_ BitVec 64)) List!203)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!890 BitStream!890 (_ BitVec 64)) List!203)

(assert (=> b!18159 (= e!11631 (= (byteArrayBitContentToList!0 (_2!1123 lt!26152) (_1!1123 lt!26152) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1123 lt!26152) thiss!1917 nBits!604)))))

(declare-fun b!18160 () Bool)

(declare-fun res!15973 () Bool)

(assert (=> b!18160 (=> (not res!15973) (not e!11631))))

(declare-fun lt!26150 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18160 (= res!15973 (= (bvadd lt!26150 nBits!604) (bitIndex!0 (size!510 (buf!828 (_2!1123 lt!26152))) (currentByte!2061 (_2!1123 lt!26152)) (currentBit!2056 (_2!1123 lt!26152)))))))

(assert (=> b!18160 (or (not (= (bvand lt!26150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26150 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18160 (= lt!26150 (bitIndex!0 (size!510 (buf!828 thiss!1917)) (currentByte!2061 thiss!1917) (currentBit!2056 thiss!1917)))))

(declare-fun d!5964 () Bool)

(assert (=> d!5964 e!11631))

(declare-fun res!15975 () Bool)

(assert (=> d!5964 (=> (not res!15975) (not e!11631))))

(assert (=> d!5964 (= res!15975 (= (buf!828 (_2!1123 lt!26152)) (buf!828 thiss!1917)))))

(declare-datatypes ((Unit!1612 0))(
  ( (Unit!1613) )
))
(declare-datatypes ((tuple3!138 0))(
  ( (tuple3!139 (_1!1126 Unit!1612) (_2!1126 BitStream!890) (_3!75 array!1206)) )
))
(declare-fun lt!26155 () tuple3!138)

(assert (=> d!5964 (= lt!26152 (tuple2!2101 (_3!75 lt!26155) (_2!1126 lt!26155)))))

(declare-fun readBitsLoop!0 (BitStream!890 (_ BitVec 64) array!1206 (_ BitVec 64) (_ BitVec 64)) tuple3!138)

(assert (=> d!5964 (= lt!26155 (readBitsLoop!0 thiss!1917 nBits!604 (array!1207 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5964 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5964 (= (readBits!0 thiss!1917 nBits!604) lt!26152)))

(declare-fun b!18161 () Bool)

(declare-fun res!15977 () Bool)

(assert (=> b!18161 (=> (not res!15977) (not e!11631))))

(assert (=> b!18161 (= res!15977 (bvsle (currentByte!2061 thiss!1917) (currentByte!2061 (_2!1123 lt!26152))))))

(assert (= (and d!5964 res!15975) b!18160))

(assert (= (and b!18160 res!15973) b!18157))

(assert (= (and b!18157 res!15974) b!18158))

(assert (= (and b!18158 res!15976) b!18161))

(assert (= (and b!18161 res!15977) b!18159))

(declare-fun m!24489 () Bool)

(assert (=> b!18157 m!24489))


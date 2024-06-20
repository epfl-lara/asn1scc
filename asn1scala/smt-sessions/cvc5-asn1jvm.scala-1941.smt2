; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50678 () Bool)

(assert start!50678)

(declare-fun b!236974 () Bool)

(declare-fun e!163827 () Bool)

(declare-fun e!163829 () Bool)

(assert (=> b!236974 (= e!163827 e!163829)))

(declare-fun res!198078 () Bool)

(assert (=> b!236974 (=> (not res!198078) (not e!163829))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun lt!372510 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> b!236974 (= res!198078 (and (= (bvand acc!170 lt!372510) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236974 (= lt!372510 (onesLSBLong!0 nBits!581))))

(declare-fun b!236975 () Bool)

(declare-fun e!163828 () Bool)

(assert (=> b!236975 (= e!163828 e!163827)))

(declare-fun res!198076 () Bool)

(assert (=> b!236975 (=> (not res!198076) (not e!163827))))

(declare-datatypes ((array!12574 0))(
  ( (array!12575 (arr!6505 (Array (_ BitVec 32) (_ BitVec 8))) (size!5518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10000 0))(
  ( (BitStream!10001 (buf!5993 array!12574) (currentByte!11164 (_ BitVec 32)) (currentBit!11159 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10000)

(declare-fun lt!372507 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236975 (= res!198076 (validate_offset_bits!1 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830)) lt!372507))))

(assert (=> b!236975 (= lt!372507 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!236976 () Bool)

(declare-fun e!163826 () Bool)

(assert (=> b!236976 (= e!163829 e!163826)))

(declare-fun res!198075 () Bool)

(assert (=> b!236976 (=> (not res!198075) (not e!163826))))

(declare-datatypes ((tuple2!20020 0))(
  ( (tuple2!20021 (_1!10914 (_ BitVec 64)) (_2!10914 BitStream!10000)) )
))
(declare-fun lt!372509 () tuple2!20020)

(assert (=> b!236976 (= res!198075 (= (buf!5993 (_2!10914 lt!372509)) (buf!5993 thiss!1830)))))

(declare-datatypes ((tuple2!20022 0))(
  ( (tuple2!20023 (_1!10915 Bool) (_2!10915 BitStream!10000)) )
))
(declare-fun lt!372508 () tuple2!20022)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20020)

(assert (=> b!236976 (= lt!372509 (readNLeastSignificantBitsLoop!0 (_2!10915 lt!372508) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10915 lt!372508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10000) tuple2!20022)

(assert (=> b!236976 (= lt!372508 (readBit!0 thiss!1830))))

(declare-fun b!236977 () Bool)

(declare-fun res!198081 () Bool)

(assert (=> b!236977 (=> (not res!198081) (not e!163826))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236977 (= res!198081 (= (bitIndex!0 (size!5518 (buf!5993 (_2!10914 lt!372509))) (currentByte!11164 (_2!10914 lt!372509)) (currentBit!11159 (_2!10914 lt!372509))) (bvadd (bitIndex!0 (size!5518 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830) (currentBit!11159 thiss!1830)) lt!372507)))))

(declare-fun b!236979 () Bool)

(declare-fun res!198079 () Bool)

(assert (=> b!236979 (=> (not res!198079) (not e!163826))))

(assert (=> b!236979 (= res!198079 (and (= (bvlshr (_1!10914 lt!372509) lt!372507) (bvlshr acc!170 lt!372507)) (= (bvand (_1!10914 lt!372509) lt!372510) (_1!10914 lt!372509)) (bvslt i!752 nBits!581)))))

(declare-fun b!236980 () Bool)

(declare-fun e!163825 () Bool)

(declare-fun array_inv!5259 (array!12574) Bool)

(assert (=> b!236980 (= e!163825 (array_inv!5259 (buf!5993 thiss!1830)))))

(declare-fun b!236981 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236981 (= e!163826 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830)))))))

(declare-fun b!236978 () Bool)

(declare-fun res!198077 () Bool)

(assert (=> b!236978 (=> (not res!198077) (not e!163827))))

(assert (=> b!236978 (= res!198077 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!198080 () Bool)

(assert (=> start!50678 (=> (not res!198080) (not e!163828))))

(assert (=> start!50678 (= res!198080 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50678 e!163828))

(assert (=> start!50678 true))

(declare-fun inv!12 (BitStream!10000) Bool)

(assert (=> start!50678 (and (inv!12 thiss!1830) e!163825)))

(assert (= (and start!50678 res!198080) b!236975))

(assert (= (and b!236975 res!198076) b!236978))

(assert (= (and b!236978 res!198077) b!236974))

(assert (= (and b!236974 res!198078) b!236976))

(assert (= (and b!236976 res!198075) b!236977))

(assert (= (and b!236977 res!198081) b!236979))

(assert (= (and b!236979 res!198079) b!236981))

(assert (= start!50678 b!236980))

(declare-fun m!359553 () Bool)

(assert (=> b!236977 m!359553))

(declare-fun m!359555 () Bool)

(assert (=> b!236977 m!359555))

(declare-fun m!359557 () Bool)

(assert (=> b!236975 m!359557))

(declare-fun m!359559 () Bool)

(assert (=> b!236981 m!359559))

(declare-fun m!359561 () Bool)

(assert (=> b!236974 m!359561))

(declare-fun m!359563 () Bool)

(assert (=> start!50678 m!359563))

(declare-fun m!359565 () Bool)

(assert (=> b!236980 m!359565))

(declare-fun m!359567 () Bool)

(assert (=> b!236978 m!359567))

(declare-fun m!359569 () Bool)

(assert (=> b!236976 m!359569))

(declare-fun m!359571 () Bool)

(assert (=> b!236976 m!359571))

(push 1)

(assert (not b!236975))

(assert (not b!236976))

(assert (not b!236977))

(assert (not b!236980))

(assert (not b!236978))

(assert (not start!50678))

(assert (not b!236981))

(assert (not b!236974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80096 () Bool)

(assert (=> d!80096 (= (array_inv!5259 (buf!5993 thiss!1830)) (bvsge (size!5518 (buf!5993 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236980 d!80096))

(declare-fun d!80098 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80098 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830)) lt!372507) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830))) lt!372507))))

(declare-fun bs!19981 () Bool)

(assert (= bs!19981 d!80098))

(declare-fun m!359621 () Bool)

(assert (=> bs!19981 m!359621))

(assert (=> b!236975 d!80098))

(declare-fun d!80100 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80100 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11159 thiss!1830) (currentByte!11164 thiss!1830) (size!5518 (buf!5993 thiss!1830))))))

(declare-fun bs!19982 () Bool)

(assert (= bs!19982 d!80100))

(declare-fun m!359623 () Bool)

(assert (=> bs!19982 m!359623))

(assert (=> start!50678 d!80100))

(declare-fun d!80102 () Bool)

(assert (=> d!80102 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19983 () Bool)

(assert (= bs!19983 d!80102))

(assert (=> bs!19983 m!359621))

(assert (=> b!236981 d!80102))

(declare-fun lt!372632 () (_ BitVec 64))

(declare-fun b!237076 () Bool)

(declare-fun lt!372631 () tuple2!20020)

(declare-fun e!163893 () Bool)

(declare-datatypes ((tuple2!20036 0))(
  ( (tuple2!20037 (_1!10922 BitStream!10000) (_2!10922 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10000) tuple2!20036)

(assert (=> b!237076 (= e!163893 (= (= (bvand (bvlshr (_1!10914 lt!372631) lt!372632) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10922 (readBitPure!0 (_2!10915 lt!372508)))))))

(assert (=> b!237076 (and (bvsge lt!372632 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372632 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372630 () (_ BitVec 32))

(assert (=> b!237076 (= lt!372632 ((_ sign_extend 32) (bvsub lt!372630 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237076 (or (= (bvand lt!372630 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!372630 #b10000000000000000000000000000000) (bvand (bvsub lt!372630 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!237076 (= lt!372630 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!237076 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!237077 () Bool)

(declare-fun res!198162 () Bool)

(declare-fun e!163894 () Bool)

(assert (=> b!237077 (=> (not res!198162) (not e!163894))))

(declare-fun lt!372629 () (_ BitVec 64))

(declare-fun lt!372625 () (_ BitVec 64))

(assert (=> b!237077 (= res!198162 (= (bvlshr (_1!10914 lt!372631) lt!372625) (bvlshr (bvor acc!170 (ite (_1!10915 lt!372508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372629)))))

(assert (=> b!237077 (and (bvsge lt!372629 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372629 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!237077 (= lt!372629 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237077 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!237077 (and (bvsge lt!372625 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372625 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!237077 (= lt!372625 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237077 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!237078 () Bool)

(declare-fun e!163892 () tuple2!20020)

(declare-fun lt!372626 () tuple2!20020)

(assert (=> b!237078 (= e!163892 (tuple2!20021 (_1!10914 lt!372626) (_2!10914 lt!372626)))))

(declare-fun lt!372627 () tuple2!20022)

(assert (=> b!237078 (= lt!372627 (readBit!0 (_2!10915 lt!372508)))))

(assert (=> b!237078 (= lt!372626 (readNLeastSignificantBitsLoop!0 (_2!10915 lt!372627) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10915 lt!372508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10915 lt!372627) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!80104 () Bool)

(assert (=> d!80104 e!163894))

(declare-fun res!198161 () Bool)

(assert (=> d!80104 (=> (not res!198161) (not e!163894))))

(assert (=> d!80104 (= res!198161 (= (buf!5993 (_2!10914 lt!372631)) (buf!5993 (_2!10915 lt!372508))))))

(assert (=> d!80104 (= lt!372631 e!163892)))

(declare-fun c!11347 () Bool)

(assert (=> d!80104 (= c!11347 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80104 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80104 (= (readNLeastSignificantBitsLoop!0 (_2!10915 lt!372508) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10915 lt!372508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372631)))

(declare-fun b!237079 () Bool)

(assert (=> b!237079 (= e!163894 e!163893)))

(declare-fun res!198160 () Bool)

(assert (=> b!237079 (=> res!198160 e!163893)))

(assert (=> b!237079 (= res!198160 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!237080 () Bool)

(declare-fun res!198164 () Bool)

(assert (=> b!237080 (=> (not res!198164) (not e!163894))))

(declare-fun lt!372633 () (_ BitVec 64))

(declare-fun lt!372628 () (_ BitVec 64))

(assert (=> b!237080 (= res!198164 (= (bitIndex!0 (size!5518 (buf!5993 (_2!10914 lt!372631))) (currentByte!11164 (_2!10914 lt!372631)) (currentBit!11159 (_2!10914 lt!372631))) (bvadd lt!372633 lt!372628)))))

(assert (=> b!237080 (or (not (= (bvand lt!372633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372628 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372633 lt!372628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237080 (= lt!372628 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237080 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!237080 (= lt!372633 (bitIndex!0 (size!5518 (buf!5993 (_2!10915 lt!372508))) (currentByte!11164 (_2!10915 lt!372508)) (currentBit!11159 (_2!10915 lt!372508))))))

(declare-fun b!237081 () Bool)

(declare-fun res!198163 () Bool)

(assert (=> b!237081 (=> (not res!198163) (not e!163894))))

(assert (=> b!237081 (= res!198163 (= (bvand (_1!10914 lt!372631) (onesLSBLong!0 nBits!581)) (_1!10914 lt!372631)))))

(declare-fun b!237082 () Bool)

(assert (=> b!237082 (= e!163892 (tuple2!20021 (bvor acc!170 (ite (_1!10915 lt!372508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10915 lt!372508)))))

(assert (= (and d!80104 c!11347) b!237082))

(assert (= (and d!80104 (not c!11347)) b!237078))

(assert (= (and d!80104 res!198161) b!237080))

(assert (= (and b!237080 res!198164) b!237077))

(assert (= (and b!237077 res!198162) b!237081))

(assert (= (and b!237081 res!198163) b!237079))

(assert (= (and b!237079 (not res!198160)) b!237076))

(declare-fun m!359645 () Bool)

(assert (=> b!237076 m!359645))

(declare-fun m!359647 () Bool)

(assert (=> b!237078 m!359647))

(declare-fun m!359649 () Bool)

(assert (=> b!237078 m!359649))

(declare-fun m!359651 () Bool)

(assert (=> b!237080 m!359651))

(declare-fun m!359653 () Bool)

(assert (=> b!237080 m!359653))

(assert (=> b!237081 m!359561))

(assert (=> b!236976 d!80104))

(declare-fun d!80120 () Bool)

(declare-fun e!163905 () Bool)

(assert (=> d!80120 e!163905))

(declare-fun res!198175 () Bool)

(assert (=> d!80120 (=> (not res!198175) (not e!163905))))

(declare-datatypes ((Unit!17393 0))(
  ( (Unit!17394) )
))
(declare-datatypes ((tuple2!20038 0))(
  ( (tuple2!20039 (_1!10923 Unit!17393) (_2!10923 BitStream!10000)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10000) tuple2!20038)

(assert (=> d!80120 (= res!198175 (= (buf!5993 (_2!10923 (increaseBitIndex!0 thiss!1830))) (buf!5993 thiss!1830)))))

(declare-fun lt!372676 () Bool)

(assert (=> d!80120 (= lt!372676 (not (= (bvand ((_ sign_extend 24) (select (arr!6505 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11159 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372673 () tuple2!20022)

(assert (=> d!80120 (= lt!372673 (tuple2!20023 (not (= (bvand ((_ sign_extend 24) (select (arr!6505 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11159 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10923 (increaseBitIndex!0 thiss!1830))))))

(assert (=> d!80120 (validate_offset_bit!0 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830)))))

(assert (=> d!80120 (= (readBit!0 thiss!1830) lt!372673)))

(declare-fun lt!372672 () (_ BitVec 64))

(declare-fun lt!372675 () (_ BitVec 64))

(declare-fun b!237093 () Bool)

(assert (=> b!237093 (= e!163905 (= (bitIndex!0 (size!5518 (buf!5993 (_2!10923 (increaseBitIndex!0 thiss!1830)))) (currentByte!11164 (_2!10923 (increaseBitIndex!0 thiss!1830))) (currentBit!11159 (_2!10923 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372672 lt!372675)))))

(assert (=> b!237093 (or (not (= (bvand lt!372672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372672 lt!372675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237093 (= lt!372675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!237093 (= lt!372672 (bitIndex!0 (size!5518 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830) (currentBit!11159 thiss!1830)))))

(declare-fun lt!372678 () Bool)

(assert (=> b!237093 (= lt!372678 (not (= (bvand ((_ sign_extend 24) (select (arr!6505 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11159 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372677 () Bool)

(assert (=> b!237093 (= lt!372677 (not (= (bvand ((_ sign_extend 24) (select (arr!6505 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11159 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372674 () Bool)

(assert (=> b!237093 (= lt!372674 (not (= (bvand ((_ sign_extend 24) (select (arr!6505 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11159 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80120 res!198175) b!237093))

(declare-fun m!359661 () Bool)

(assert (=> d!80120 m!359661))

(declare-fun m!359663 () Bool)

(assert (=> d!80120 m!359663))

(declare-fun m!359665 () Bool)

(assert (=> d!80120 m!359665))

(assert (=> d!80120 m!359559))

(assert (=> b!237093 m!359555))

(assert (=> b!237093 m!359661))

(assert (=> b!237093 m!359663))

(assert (=> b!237093 m!359665))

(declare-fun m!359667 () Bool)

(assert (=> b!237093 m!359667))

(assert (=> b!236976 d!80120))

(declare-fun d!80130 () Bool)

(declare-fun e!163908 () Bool)

(assert (=> d!80130 e!163908))

(declare-fun res!198180 () Bool)

(assert (=> d!80130 (=> (not res!198180) (not e!163908))))

(declare-fun lt!372695 () (_ BitVec 64))

(declare-fun lt!372691 () (_ BitVec 64))

(declare-fun lt!372696 () (_ BitVec 64))

(assert (=> d!80130 (= res!198180 (= lt!372696 (bvsub lt!372695 lt!372691)))))

(assert (=> d!80130 (or (= (bvand lt!372695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372691 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372695 lt!372691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80130 (= lt!372691 (remainingBits!0 ((_ sign_extend 32) (size!5518 (buf!5993 (_2!10914 lt!372509)))) ((_ sign_extend 32) (currentByte!11164 (_2!10914 lt!372509))) ((_ sign_extend 32) (currentBit!11159 (_2!10914 lt!372509)))))))

(declare-fun lt!372694 () (_ BitVec 64))

(declare-fun lt!372693 () (_ BitVec 64))

(assert (=> d!80130 (= lt!372695 (bvmul lt!372694 lt!372693))))

(assert (=> d!80130 (or (= lt!372694 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372693 (bvsdiv (bvmul lt!372694 lt!372693) lt!372694)))))

(assert (=> d!80130 (= lt!372693 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80130 (= lt!372694 ((_ sign_extend 32) (size!5518 (buf!5993 (_2!10914 lt!372509)))))))

(assert (=> d!80130 (= lt!372696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11164 (_2!10914 lt!372509))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11159 (_2!10914 lt!372509)))))))

(assert (=> d!80130 (invariant!0 (currentBit!11159 (_2!10914 lt!372509)) (currentByte!11164 (_2!10914 lt!372509)) (size!5518 (buf!5993 (_2!10914 lt!372509))))))

(assert (=> d!80130 (= (bitIndex!0 (size!5518 (buf!5993 (_2!10914 lt!372509))) (currentByte!11164 (_2!10914 lt!372509)) (currentBit!11159 (_2!10914 lt!372509))) lt!372696)))

(declare-fun b!237098 () Bool)

(declare-fun res!198181 () Bool)

(assert (=> b!237098 (=> (not res!198181) (not e!163908))))

(assert (=> b!237098 (= res!198181 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372696))))

(declare-fun b!237099 () Bool)

(declare-fun lt!372692 () (_ BitVec 64))

(assert (=> b!237099 (= e!163908 (bvsle lt!372696 (bvmul lt!372692 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!237099 (or (= lt!372692 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372692 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372692)))))

(assert (=> b!237099 (= lt!372692 ((_ sign_extend 32) (size!5518 (buf!5993 (_2!10914 lt!372509)))))))

(assert (= (and d!80130 res!198180) b!237098))

(assert (= (and b!237098 res!198181) b!237099))

(declare-fun m!359669 () Bool)

(assert (=> d!80130 m!359669))

(declare-fun m!359671 () Bool)

(assert (=> d!80130 m!359671))

(assert (=> b!236977 d!80130))

(declare-fun d!80132 () Bool)

(declare-fun e!163909 () Bool)

(assert (=> d!80132 e!163909))

(declare-fun res!198182 () Bool)

(assert (=> d!80132 (=> (not res!198182) (not e!163909))))

(declare-fun lt!372702 () (_ BitVec 64))

(declare-fun lt!372697 () (_ BitVec 64))

(declare-fun lt!372701 () (_ BitVec 64))

(assert (=> d!80132 (= res!198182 (= lt!372702 (bvsub lt!372701 lt!372697)))))

(assert (=> d!80132 (or (= (bvand lt!372701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372701 lt!372697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80132 (= lt!372697 (remainingBits!0 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))) ((_ sign_extend 32) (currentByte!11164 thiss!1830)) ((_ sign_extend 32) (currentBit!11159 thiss!1830))))))

(declare-fun lt!372700 () (_ BitVec 64))

(declare-fun lt!372699 () (_ BitVec 64))

(assert (=> d!80132 (= lt!372701 (bvmul lt!372700 lt!372699))))

(assert (=> d!80132 (or (= lt!372700 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372699 (bvsdiv (bvmul lt!372700 lt!372699) lt!372700)))))

(assert (=> d!80132 (= lt!372699 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80132 (= lt!372700 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))))))

(assert (=> d!80132 (= lt!372702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11164 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11159 thiss!1830))))))

(assert (=> d!80132 (invariant!0 (currentBit!11159 thiss!1830) (currentByte!11164 thiss!1830) (size!5518 (buf!5993 thiss!1830)))))

(assert (=> d!80132 (= (bitIndex!0 (size!5518 (buf!5993 thiss!1830)) (currentByte!11164 thiss!1830) (currentBit!11159 thiss!1830)) lt!372702)))

(declare-fun b!237100 () Bool)

(declare-fun res!198183 () Bool)

(assert (=> b!237100 (=> (not res!198183) (not e!163909))))

(assert (=> b!237100 (= res!198183 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372702))))

(declare-fun b!237101 () Bool)

(declare-fun lt!372698 () (_ BitVec 64))

(assert (=> b!237101 (= e!163909 (bvsle lt!372702 (bvmul lt!372698 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!237101 (or (= lt!372698 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372698 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372698)))))

(assert (=> b!237101 (= lt!372698 ((_ sign_extend 32) (size!5518 (buf!5993 thiss!1830))))))

(assert (= (and d!80132 res!198182) b!237100))

(assert (= (and b!237100 res!198183) b!237101))

(assert (=> d!80132 m!359621))

(assert (=> d!80132 m!359623))

(assert (=> b!236977 d!80132))

(declare-fun d!80134 () Bool)

(assert (=> d!80134 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236978 d!80134))

(declare-fun d!80136 () Bool)

(assert (=> d!80136 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236974 d!80136))

(push 1)

(assert (not b!237081))

(assert (not d!80098))

(assert (not b!237076))

(assert (not d!80100))

(assert (not d!80132))

(assert (not d!80120))

(assert (not b!237093))

(assert (not d!80130))

(assert (not b!237080))

(assert (not d!80102))

(assert (not b!237078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


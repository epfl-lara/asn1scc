; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21468 () Bool)

(assert start!21468)

(declare-fun b!107984 () Bool)

(declare-fun res!88995 () Bool)

(declare-fun e!70668 () Bool)

(assert (=> b!107984 (=> (not res!88995) (not e!70668))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107984 (= res!88995 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107985 () Bool)

(declare-fun e!70673 () Bool)

(declare-datatypes ((array!4936 0))(
  ( (array!4937 (arr!2839 (Array (_ BitVec 32) (_ BitVec 8))) (size!2246 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3966 0))(
  ( (BitStream!3967 (buf!2634 array!4936) (currentByte!5164 (_ BitVec 32)) (currentBit!5159 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6610 0))(
  ( (Unit!6611) )
))
(declare-datatypes ((tuple2!8888 0))(
  ( (tuple2!8889 (_1!4701 Unit!6610) (_2!4701 BitStream!3966)) )
))
(declare-fun lt!162167 () tuple2!8888)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107985 (= e!70673 (invariant!0 (currentBit!5159 (_2!4701 lt!162167)) (currentByte!5164 (_2!4701 lt!162167)) (size!2246 (buf!2634 (_2!4701 lt!162167)))))))

(declare-fun b!107986 () Bool)

(declare-fun e!70663 () Bool)

(declare-datatypes ((tuple2!8890 0))(
  ( (tuple2!8891 (_1!4702 BitStream!3966) (_2!4702 Bool)) )
))
(declare-fun lt!162192 () tuple2!8890)

(declare-fun lt!162182 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107986 (= e!70663 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162192))) (currentByte!5164 (_1!4702 lt!162192)) (currentBit!5159 (_1!4702 lt!162192))) lt!162182))))

(declare-fun b!107987 () Bool)

(declare-fun e!70672 () Bool)

(declare-fun lt!162166 () tuple2!8890)

(declare-fun lt!162194 () tuple2!8890)

(assert (=> b!107987 (= e!70672 (= (_2!4702 lt!162166) (_2!4702 lt!162194)))))

(declare-fun b!107988 () Bool)

(declare-fun e!70667 () Bool)

(declare-fun thiss!1305 () BitStream!3966)

(declare-fun array_inv!2048 (array!4936) Bool)

(assert (=> b!107988 (= e!70667 (array_inv!2048 (buf!2634 thiss!1305)))))

(declare-fun b!107989 () Bool)

(declare-fun res!88992 () Bool)

(assert (=> b!107989 (=> (not res!88992) (not e!70668))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!107989 (= res!88992 (bvslt i!615 nBits!396))))

(declare-fun b!107990 () Bool)

(declare-fun e!70664 () Bool)

(assert (=> b!107990 (= e!70664 (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162167)))))))

(declare-fun b!107991 () Bool)

(declare-fun e!70666 () Bool)

(declare-fun e!70665 () Bool)

(assert (=> b!107991 (= e!70666 e!70665)))

(declare-fun res!89005 () Bool)

(assert (=> b!107991 (=> (not res!89005) (not e!70665))))

(declare-fun lt!162193 () (_ BitVec 64))

(assert (=> b!107991 (= res!89005 (= lt!162182 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!162193)))))

(declare-fun lt!162184 () tuple2!8888)

(assert (=> b!107991 (= lt!162182 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(assert (=> b!107991 (= lt!162193 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(declare-fun res!89003 () Bool)

(declare-fun e!70662 () Bool)

(assert (=> start!21468 (=> (not res!89003) (not e!70662))))

(assert (=> start!21468 (= res!89003 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21468 e!70662))

(assert (=> start!21468 true))

(declare-fun inv!12 (BitStream!3966) Bool)

(assert (=> start!21468 (and (inv!12 thiss!1305) e!70667)))

(declare-fun b!107992 () Bool)

(declare-fun res!88996 () Bool)

(assert (=> b!107992 (=> (not res!88996) (not e!70665))))

(declare-fun isPrefixOf!0 (BitStream!3966 BitStream!3966) Bool)

(assert (=> b!107992 (= res!88996 (isPrefixOf!0 thiss!1305 (_2!4701 lt!162184)))))

(declare-fun b!107993 () Bool)

(declare-fun e!70669 () Bool)

(assert (=> b!107993 (= e!70669 e!70673)))

(declare-fun res!88993 () Bool)

(assert (=> b!107993 (=> res!88993 e!70673)))

(declare-fun lt!162171 () BitStream!3966)

(declare-datatypes ((tuple2!8892 0))(
  ( (tuple2!8893 (_1!4703 BitStream!3966) (_2!4703 BitStream!3966)) )
))
(declare-fun lt!162191 () tuple2!8892)

(assert (=> b!107993 (= res!88993 (or (not (= (_1!4703 lt!162191) lt!162171)) (not (= (size!2246 (buf!2634 thiss!1305)) (size!2246 (buf!2634 (_2!4701 lt!162167)))))))))

(declare-fun e!70670 () Bool)

(assert (=> b!107993 e!70670))

(declare-fun res!89002 () Bool)

(assert (=> b!107993 (=> (not res!89002) (not e!70670))))

(declare-fun lt!162176 () (_ BitVec 64))

(declare-fun lt!162180 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3966 (_ BitVec 64)) BitStream!3966)

(assert (=> b!107993 (= res!89002 (= (_1!4703 lt!162191) (withMovedBitIndex!0 (_2!4703 lt!162191) (bvsub lt!162180 lt!162176))))))

(assert (=> b!107993 (= lt!162180 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(declare-fun lt!162179 () tuple2!8892)

(declare-fun lt!162172 () (_ BitVec 64))

(assert (=> b!107993 (= (_1!4703 lt!162179) (withMovedBitIndex!0 (_2!4703 lt!162179) (bvsub lt!162172 lt!162176)))))

(assert (=> b!107993 (= lt!162176 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162167))) (currentByte!5164 (_2!4701 lt!162167)) (currentBit!5159 (_2!4701 lt!162167))))))

(assert (=> b!107993 (= lt!162172 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(declare-datatypes ((tuple2!8894 0))(
  ( (tuple2!8895 (_1!4704 BitStream!3966) (_2!4704 (_ BitVec 64))) )
))
(declare-fun lt!162189 () tuple2!8894)

(declare-fun lt!162181 () tuple2!8894)

(assert (=> b!107993 (and (= (_2!4704 lt!162189) (_2!4704 lt!162181)) (= (_1!4704 lt!162189) (_1!4704 lt!162181)))))

(declare-fun lt!162186 () (_ BitVec 64))

(declare-fun lt!162177 () Unit!6610)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6610)

(assert (=> b!107993 (= lt!162177 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4703 lt!162179) nBits!396 i!615 lt!162186))))

(declare-fun lt!162170 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8894)

(assert (=> b!107993 (= lt!162181 (readNLeastSignificantBitsLoopPure!0 lt!162171 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162170))))

(assert (=> b!107993 (= lt!162171 (withMovedBitIndex!0 (_1!4703 lt!162179) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!107994 () Bool)

(declare-fun lt!162188 () tuple2!8894)

(assert (=> b!107994 (= e!70670 (and (= lt!162172 (bvsub lt!162180 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4703 lt!162191) lt!162171)) (and (= (_2!4704 lt!162189) (_2!4704 lt!162188)) (= (_1!4704 lt!162189) (_2!4703 lt!162179))))))))

(declare-fun b!107995 () Bool)

(assert (=> b!107995 (= e!70668 (not e!70669))))

(declare-fun res!89004 () Bool)

(assert (=> b!107995 (=> res!89004 e!70669)))

(assert (=> b!107995 (= res!89004 (not (= (_1!4704 lt!162188) (_2!4703 lt!162191))))))

(assert (=> b!107995 (= lt!162188 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162191) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162170))))

(declare-fun lt!162168 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107995 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184))) lt!162168)))

(declare-fun lt!162169 () Unit!6610)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3966 array!4936 (_ BitVec 64)) Unit!6610)

(assert (=> b!107995 (= lt!162169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4701 lt!162184) (buf!2634 (_2!4701 lt!162167)) lt!162168))))

(assert (=> b!107995 (= lt!162168 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!162173 () tuple2!8890)

(declare-fun lt!162187 () (_ BitVec 64))

(assert (=> b!107995 (= lt!162170 (bvor lt!162186 (ite (_2!4702 lt!162173) lt!162187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107995 (= lt!162189 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162179) nBits!396 i!615 lt!162186))))

(declare-fun lt!162183 () (_ BitVec 64))

(assert (=> b!107995 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305)) lt!162183)))

(declare-fun lt!162190 () Unit!6610)

(assert (=> b!107995 (= lt!162190 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2634 (_2!4701 lt!162167)) lt!162183))))

(assert (=> b!107995 (= lt!162186 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!162174 () Bool)

(assert (=> b!107995 (= (_2!4702 lt!162173) lt!162174)))

(declare-fun readBitPure!0 (BitStream!3966) tuple2!8890)

(assert (=> b!107995 (= lt!162173 (readBitPure!0 (_1!4703 lt!162179)))))

(declare-fun reader!0 (BitStream!3966 BitStream!3966) tuple2!8892)

(assert (=> b!107995 (= lt!162191 (reader!0 (_2!4701 lt!162184) (_2!4701 lt!162167)))))

(assert (=> b!107995 (= lt!162179 (reader!0 thiss!1305 (_2!4701 lt!162167)))))

(assert (=> b!107995 e!70672))

(declare-fun res!88999 () Bool)

(assert (=> b!107995 (=> (not res!88999) (not e!70672))))

(assert (=> b!107995 (= res!88999 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162166))) (currentByte!5164 (_1!4702 lt!162166)) (currentBit!5159 (_1!4702 lt!162166))) (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162194))) (currentByte!5164 (_1!4702 lt!162194)) (currentBit!5159 (_1!4702 lt!162194)))))))

(declare-fun lt!162185 () Unit!6610)

(declare-fun lt!162175 () BitStream!3966)

(declare-fun readBitPrefixLemma!0 (BitStream!3966 BitStream!3966) Unit!6610)

(assert (=> b!107995 (= lt!162185 (readBitPrefixLemma!0 lt!162175 (_2!4701 lt!162167)))))

(assert (=> b!107995 (= lt!162194 (readBitPure!0 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305))))))

(assert (=> b!107995 (= lt!162166 (readBitPure!0 lt!162175))))

(assert (=> b!107995 (= lt!162175 (BitStream!3967 (buf!2634 (_2!4701 lt!162184)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(assert (=> b!107995 e!70664))

(declare-fun res!88997 () Bool)

(assert (=> b!107995 (=> (not res!88997) (not e!70664))))

(assert (=> b!107995 (= res!88997 (isPrefixOf!0 thiss!1305 (_2!4701 lt!162167)))))

(declare-fun lt!162178 () Unit!6610)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3966 BitStream!3966 BitStream!3966) Unit!6610)

(assert (=> b!107995 (= lt!162178 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4701 lt!162184) (_2!4701 lt!162167)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3966 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8888)

(assert (=> b!107995 (= lt!162167 (appendNLeastSignificantBitsLoop!0 (_2!4701 lt!162184) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!107995 e!70666))

(declare-fun res!89001 () Bool)

(assert (=> b!107995 (=> (not res!89001) (not e!70666))))

(assert (=> b!107995 (= res!89001 (= (size!2246 (buf!2634 thiss!1305)) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(declare-fun appendBit!0 (BitStream!3966 Bool) tuple2!8888)

(assert (=> b!107995 (= lt!162184 (appendBit!0 thiss!1305 lt!162174))))

(assert (=> b!107995 (= lt!162174 (not (= (bvand v!199 lt!162187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107995 (= lt!162187 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107996 () Bool)

(assert (=> b!107996 (= e!70662 e!70668)))

(declare-fun res!88994 () Bool)

(assert (=> b!107996 (=> (not res!88994) (not e!70668))))

(assert (=> b!107996 (= res!88994 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305)) lt!162183))))

(assert (=> b!107996 (= lt!162183 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!107997 () Bool)

(assert (=> b!107997 (= e!70665 e!70663)))

(declare-fun res!89000 () Bool)

(assert (=> b!107997 (=> (not res!89000) (not e!70663))))

(assert (=> b!107997 (= res!89000 (and (= (_2!4702 lt!162192) lt!162174) (= (_1!4702 lt!162192) (_2!4701 lt!162184))))))

(declare-fun readerFrom!0 (BitStream!3966 (_ BitVec 32) (_ BitVec 32)) BitStream!3966)

(assert (=> b!107997 (= lt!162192 (readBitPure!0 (readerFrom!0 (_2!4701 lt!162184) (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305))))))

(declare-fun b!107998 () Bool)

(declare-fun res!88998 () Bool)

(assert (=> b!107998 (=> (not res!88998) (not e!70664))))

(assert (=> b!107998 (= res!88998 (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(assert (= (and start!21468 res!89003) b!107996))

(assert (= (and b!107996 res!88994) b!107984))

(assert (= (and b!107984 res!88995) b!107989))

(assert (= (and b!107989 res!88992) b!107995))

(assert (= (and b!107995 res!89001) b!107991))

(assert (= (and b!107991 res!89005) b!107992))

(assert (= (and b!107992 res!88996) b!107997))

(assert (= (and b!107997 res!89000) b!107986))

(assert (= (and b!107995 res!88997) b!107998))

(assert (= (and b!107998 res!88998) b!107990))

(assert (= (and b!107995 res!88999) b!107987))

(assert (= (and b!107995 (not res!89004)) b!107993))

(assert (= (and b!107993 res!89002) b!107994))

(assert (= (and b!107993 (not res!88993)) b!107985))

(assert (= start!21468 b!107988))

(declare-fun m!159771 () Bool)

(assert (=> b!107992 m!159771))

(declare-fun m!159773 () Bool)

(assert (=> b!107990 m!159773))

(declare-fun m!159775 () Bool)

(assert (=> b!107985 m!159775))

(declare-fun m!159777 () Bool)

(assert (=> b!107997 m!159777))

(assert (=> b!107997 m!159777))

(declare-fun m!159779 () Bool)

(assert (=> b!107997 m!159779))

(declare-fun m!159781 () Bool)

(assert (=> b!107998 m!159781))

(declare-fun m!159783 () Bool)

(assert (=> start!21468 m!159783))

(declare-fun m!159785 () Bool)

(assert (=> b!107993 m!159785))

(declare-fun m!159787 () Bool)

(assert (=> b!107993 m!159787))

(declare-fun m!159789 () Bool)

(assert (=> b!107993 m!159789))

(declare-fun m!159791 () Bool)

(assert (=> b!107993 m!159791))

(declare-fun m!159793 () Bool)

(assert (=> b!107993 m!159793))

(declare-fun m!159795 () Bool)

(assert (=> b!107993 m!159795))

(declare-fun m!159797 () Bool)

(assert (=> b!107993 m!159797))

(declare-fun m!159799 () Bool)

(assert (=> b!107993 m!159799))

(declare-fun m!159801 () Bool)

(assert (=> b!107986 m!159801))

(declare-fun m!159803 () Bool)

(assert (=> b!107995 m!159803))

(declare-fun m!159805 () Bool)

(assert (=> b!107995 m!159805))

(declare-fun m!159807 () Bool)

(assert (=> b!107995 m!159807))

(declare-fun m!159809 () Bool)

(assert (=> b!107995 m!159809))

(declare-fun m!159811 () Bool)

(assert (=> b!107995 m!159811))

(declare-fun m!159813 () Bool)

(assert (=> b!107995 m!159813))

(declare-fun m!159815 () Bool)

(assert (=> b!107995 m!159815))

(declare-fun m!159817 () Bool)

(assert (=> b!107995 m!159817))

(declare-fun m!159819 () Bool)

(assert (=> b!107995 m!159819))

(declare-fun m!159821 () Bool)

(assert (=> b!107995 m!159821))

(declare-fun m!159823 () Bool)

(assert (=> b!107995 m!159823))

(declare-fun m!159825 () Bool)

(assert (=> b!107995 m!159825))

(declare-fun m!159827 () Bool)

(assert (=> b!107995 m!159827))

(declare-fun m!159829 () Bool)

(assert (=> b!107995 m!159829))

(declare-fun m!159831 () Bool)

(assert (=> b!107995 m!159831))

(declare-fun m!159833 () Bool)

(assert (=> b!107995 m!159833))

(declare-fun m!159835 () Bool)

(assert (=> b!107995 m!159835))

(declare-fun m!159837 () Bool)

(assert (=> b!107995 m!159837))

(declare-fun m!159839 () Bool)

(assert (=> b!107995 m!159839))

(declare-fun m!159841 () Bool)

(assert (=> b!107988 m!159841))

(declare-fun m!159843 () Bool)

(assert (=> b!107984 m!159843))

(assert (=> b!107991 m!159789))

(assert (=> b!107991 m!159793))

(declare-fun m!159845 () Bool)

(assert (=> b!107996 m!159845))

(check-sat (not b!107986) (not b!107997) (not b!107991) (not b!107985) (not b!107995) (not b!107993) (not b!107990) (not b!107992) (not start!21468) (not b!107988) (not b!107998) (not b!107984) (not b!107996))
(check-sat)
(get-model)

(declare-fun d!34172 () Bool)

(assert (=> d!34172 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107984 d!34172))

(declare-fun d!34174 () Bool)

(assert (=> d!34174 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107995 d!34174))

(declare-fun d!34176 () Bool)

(declare-fun res!89056 () Bool)

(declare-fun e!70714 () Bool)

(assert (=> d!34176 (=> (not res!89056) (not e!70714))))

(assert (=> d!34176 (= res!89056 (= (size!2246 (buf!2634 thiss!1305)) (size!2246 (buf!2634 (_2!4701 lt!162167)))))))

(assert (=> d!34176 (= (isPrefixOf!0 thiss!1305 (_2!4701 lt!162167)) e!70714)))

(declare-fun b!108050 () Bool)

(declare-fun res!89055 () Bool)

(assert (=> b!108050 (=> (not res!89055) (not e!70714))))

(assert (=> b!108050 (= res!89055 (bvsle (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)) (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162167))) (currentByte!5164 (_2!4701 lt!162167)) (currentBit!5159 (_2!4701 lt!162167)))))))

(declare-fun b!108051 () Bool)

(declare-fun e!70715 () Bool)

(assert (=> b!108051 (= e!70714 e!70715)))

(declare-fun res!89054 () Bool)

(assert (=> b!108051 (=> res!89054 e!70715)))

(assert (=> b!108051 (= res!89054 (= (size!2246 (buf!2634 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!108052 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4936 array!4936 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108052 (= e!70715 (arrayBitRangesEq!0 (buf!2634 thiss!1305) (buf!2634 (_2!4701 lt!162167)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305))))))

(assert (= (and d!34176 res!89056) b!108050))

(assert (= (and b!108050 res!89055) b!108051))

(assert (= (and b!108051 (not res!89054)) b!108052))

(assert (=> b!108050 m!159793))

(assert (=> b!108050 m!159785))

(assert (=> b!108052 m!159793))

(assert (=> b!108052 m!159793))

(declare-fun m!159923 () Bool)

(assert (=> b!108052 m!159923))

(assert (=> b!107995 d!34176))

(declare-fun d!34178 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34178 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184))) lt!162168) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184)))) lt!162168))))

(declare-fun bs!8333 () Bool)

(assert (= bs!8333 d!34178))

(declare-fun m!159925 () Bool)

(assert (=> bs!8333 m!159925))

(assert (=> b!107995 d!34178))

(declare-fun d!34180 () Bool)

(declare-datatypes ((tuple2!8904 0))(
  ( (tuple2!8905 (_1!4709 Bool) (_2!4709 BitStream!3966)) )
))
(declare-fun lt!162284 () tuple2!8904)

(declare-fun readBit!0 (BitStream!3966) tuple2!8904)

(assert (=> d!34180 (= lt!162284 (readBit!0 (_1!4703 lt!162179)))))

(assert (=> d!34180 (= (readBitPure!0 (_1!4703 lt!162179)) (tuple2!8891 (_2!4709 lt!162284) (_1!4709 lt!162284)))))

(declare-fun bs!8334 () Bool)

(assert (= bs!8334 d!34180))

(declare-fun m!159927 () Bool)

(assert (=> bs!8334 m!159927))

(assert (=> b!107995 d!34180))

(declare-fun b!108064 () Bool)

(declare-fun e!70721 () Bool)

(declare-fun e!70720 () Bool)

(assert (=> b!108064 (= e!70721 e!70720)))

(declare-fun res!89065 () Bool)

(assert (=> b!108064 (=> (not res!89065) (not e!70720))))

(declare-fun lt!162295 () tuple2!8888)

(declare-fun lt!162296 () tuple2!8890)

(assert (=> b!108064 (= res!89065 (and (= (_2!4702 lt!162296) lt!162174) (= (_1!4702 lt!162296) (_2!4701 lt!162295))))))

(assert (=> b!108064 (= lt!162296 (readBitPure!0 (readerFrom!0 (_2!4701 lt!162295) (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305))))))

(declare-fun b!108063 () Bool)

(declare-fun res!89068 () Bool)

(assert (=> b!108063 (=> (not res!89068) (not e!70721))))

(assert (=> b!108063 (= res!89068 (isPrefixOf!0 thiss!1305 (_2!4701 lt!162295)))))

(declare-fun b!108065 () Bool)

(assert (=> b!108065 (= e!70720 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162296))) (currentByte!5164 (_1!4702 lt!162296)) (currentBit!5159 (_1!4702 lt!162296))) (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162295))) (currentByte!5164 (_2!4701 lt!162295)) (currentBit!5159 (_2!4701 lt!162295)))))))

(declare-fun b!108062 () Bool)

(declare-fun res!89066 () Bool)

(assert (=> b!108062 (=> (not res!89066) (not e!70721))))

(declare-fun lt!162293 () (_ BitVec 64))

(declare-fun lt!162294 () (_ BitVec 64))

(assert (=> b!108062 (= res!89066 (= (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162295))) (currentByte!5164 (_2!4701 lt!162295)) (currentBit!5159 (_2!4701 lt!162295))) (bvadd lt!162294 lt!162293)))))

(assert (=> b!108062 (or (not (= (bvand lt!162294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162293 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162294 lt!162293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108062 (= lt!162293 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!108062 (= lt!162294 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(declare-fun d!34182 () Bool)

(assert (=> d!34182 e!70721))

(declare-fun res!89067 () Bool)

(assert (=> d!34182 (=> (not res!89067) (not e!70721))))

(assert (=> d!34182 (= res!89067 (= (size!2246 (buf!2634 thiss!1305)) (size!2246 (buf!2634 (_2!4701 lt!162295)))))))

(declare-fun choose!16 (BitStream!3966 Bool) tuple2!8888)

(assert (=> d!34182 (= lt!162295 (choose!16 thiss!1305 lt!162174))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34182 (validate_offset_bit!0 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305)))))

(assert (=> d!34182 (= (appendBit!0 thiss!1305 lt!162174) lt!162295)))

(assert (= (and d!34182 res!89067) b!108062))

(assert (= (and b!108062 res!89066) b!108063))

(assert (= (and b!108063 res!89068) b!108064))

(assert (= (and b!108064 res!89065) b!108065))

(declare-fun m!159929 () Bool)

(assert (=> d!34182 m!159929))

(declare-fun m!159931 () Bool)

(assert (=> d!34182 m!159931))

(declare-fun m!159933 () Bool)

(assert (=> b!108065 m!159933))

(declare-fun m!159935 () Bool)

(assert (=> b!108065 m!159935))

(declare-fun m!159937 () Bool)

(assert (=> b!108063 m!159937))

(assert (=> b!108062 m!159935))

(assert (=> b!108062 m!159793))

(declare-fun m!159939 () Bool)

(assert (=> b!108064 m!159939))

(assert (=> b!108064 m!159939))

(declare-fun m!159941 () Bool)

(assert (=> b!108064 m!159941))

(assert (=> b!107995 d!34182))

(declare-fun d!34184 () Bool)

(declare-fun e!70724 () Bool)

(assert (=> d!34184 e!70724))

(declare-fun res!89074 () Bool)

(assert (=> d!34184 (=> (not res!89074) (not e!70724))))

(declare-fun lt!162310 () (_ BitVec 64))

(declare-fun lt!162309 () (_ BitVec 64))

(declare-fun lt!162312 () (_ BitVec 64))

(assert (=> d!34184 (= res!89074 (= lt!162310 (bvsub lt!162312 lt!162309)))))

(assert (=> d!34184 (or (= (bvand lt!162312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162312 lt!162309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34184 (= lt!162309 (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162166)))) ((_ sign_extend 32) (currentByte!5164 (_1!4702 lt!162166))) ((_ sign_extend 32) (currentBit!5159 (_1!4702 lt!162166)))))))

(declare-fun lt!162314 () (_ BitVec 64))

(declare-fun lt!162313 () (_ BitVec 64))

(assert (=> d!34184 (= lt!162312 (bvmul lt!162314 lt!162313))))

(assert (=> d!34184 (or (= lt!162314 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162313 (bvsdiv (bvmul lt!162314 lt!162313) lt!162314)))))

(assert (=> d!34184 (= lt!162313 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34184 (= lt!162314 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162166)))))))

(assert (=> d!34184 (= lt!162310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5164 (_1!4702 lt!162166))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5159 (_1!4702 lt!162166)))))))

(assert (=> d!34184 (invariant!0 (currentBit!5159 (_1!4702 lt!162166)) (currentByte!5164 (_1!4702 lt!162166)) (size!2246 (buf!2634 (_1!4702 lt!162166))))))

(assert (=> d!34184 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162166))) (currentByte!5164 (_1!4702 lt!162166)) (currentBit!5159 (_1!4702 lt!162166))) lt!162310)))

(declare-fun b!108070 () Bool)

(declare-fun res!89073 () Bool)

(assert (=> b!108070 (=> (not res!89073) (not e!70724))))

(assert (=> b!108070 (= res!89073 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162310))))

(declare-fun b!108071 () Bool)

(declare-fun lt!162311 () (_ BitVec 64))

(assert (=> b!108071 (= e!70724 (bvsle lt!162310 (bvmul lt!162311 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108071 (or (= lt!162311 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162311 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162311)))))

(assert (=> b!108071 (= lt!162311 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162166)))))))

(assert (= (and d!34184 res!89074) b!108070))

(assert (= (and b!108070 res!89073) b!108071))

(declare-fun m!159943 () Bool)

(assert (=> d!34184 m!159943))

(declare-fun m!159945 () Bool)

(assert (=> d!34184 m!159945))

(assert (=> b!107995 d!34184))

(declare-fun d!34186 () Bool)

(assert (=> d!34186 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305)) lt!162183) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305))) lt!162183))))

(declare-fun bs!8335 () Bool)

(assert (= bs!8335 d!34186))

(declare-fun m!159947 () Bool)

(assert (=> bs!8335 m!159947))

(assert (=> b!107995 d!34186))

(declare-fun d!34188 () Bool)

(declare-fun lt!162315 () tuple2!8904)

(assert (=> d!34188 (= lt!162315 (readBit!0 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305))))))

(assert (=> d!34188 (= (readBitPure!0 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305))) (tuple2!8891 (_2!4709 lt!162315) (_1!4709 lt!162315)))))

(declare-fun bs!8336 () Bool)

(assert (= bs!8336 d!34188))

(declare-fun m!159949 () Bool)

(assert (=> bs!8336 m!159949))

(assert (=> b!107995 d!34188))

(declare-fun b!108177 () Bool)

(declare-fun res!89164 () Bool)

(declare-fun e!70789 () Bool)

(assert (=> b!108177 (=> (not res!89164) (not e!70789))))

(declare-fun lt!162651 () (_ BitVec 64))

(declare-fun lt!162647 () tuple2!8888)

(declare-fun lt!162666 () (_ BitVec 64))

(assert (=> b!108177 (= res!89164 (= (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162647))) (currentByte!5164 (_2!4701 lt!162647)) (currentBit!5159 (_2!4701 lt!162647))) (bvadd lt!162651 lt!162666)))))

(assert (=> b!108177 (or (not (= (bvand lt!162651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162666 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162651 lt!162666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108177 (= lt!162666 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!108177 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108177 (= lt!162651 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(declare-fun d!34190 () Bool)

(assert (=> d!34190 e!70789))

(declare-fun res!89165 () Bool)

(assert (=> d!34190 (=> (not res!89165) (not e!70789))))

(assert (=> d!34190 (= res!89165 (= (size!2246 (buf!2634 (_2!4701 lt!162184))) (size!2246 (buf!2634 (_2!4701 lt!162647)))))))

(declare-fun e!70788 () tuple2!8888)

(assert (=> d!34190 (= lt!162647 e!70788)))

(declare-fun c!6670 () Bool)

(assert (=> d!34190 (= c!6670 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34190 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34190 (= (appendNLeastSignificantBitsLoop!0 (_2!4701 lt!162184) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!162647)))

(declare-fun b!108178 () Bool)

(declare-fun e!70784 () Bool)

(declare-fun lt!162663 () tuple2!8890)

(declare-fun lt!162659 () tuple2!8890)

(assert (=> b!108178 (= e!70784 (= (_2!4702 lt!162663) (_2!4702 lt!162659)))))

(declare-fun b!108179 () Bool)

(declare-fun res!89168 () Bool)

(declare-fun lt!162665 () tuple2!8888)

(assert (=> b!108179 (= res!89168 (isPrefixOf!0 (_2!4701 lt!162184) (_2!4701 lt!162665)))))

(declare-fun e!70786 () Bool)

(assert (=> b!108179 (=> (not res!89168) (not e!70786))))

(declare-fun b!108180 () Bool)

(declare-fun res!89161 () Bool)

(assert (=> b!108180 (= res!89161 (= (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162665))) (currentByte!5164 (_2!4701 lt!162665)) (currentBit!5159 (_2!4701 lt!162665))) (bvadd (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!108180 (=> (not res!89161) (not e!70786))))

(declare-fun b!108181 () Bool)

(declare-fun lt!162689 () tuple2!8888)

(declare-fun Unit!6614 () Unit!6610)

(assert (=> b!108181 (= e!70788 (tuple2!8889 Unit!6614 (_2!4701 lt!162689)))))

(declare-fun lt!162675 () Bool)

(assert (=> b!108181 (= lt!162675 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108181 (= lt!162665 (appendBit!0 (_2!4701 lt!162184) lt!162675))))

(declare-fun res!89169 () Bool)

(assert (=> b!108181 (= res!89169 (= (size!2246 (buf!2634 (_2!4701 lt!162184))) (size!2246 (buf!2634 (_2!4701 lt!162665)))))))

(assert (=> b!108181 (=> (not res!89169) (not e!70786))))

(assert (=> b!108181 e!70786))

(declare-fun lt!162662 () tuple2!8888)

(assert (=> b!108181 (= lt!162662 lt!162665)))

(assert (=> b!108181 (= lt!162689 (appendNLeastSignificantBitsLoop!0 (_2!4701 lt!162662) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!162686 () Unit!6610)

(assert (=> b!108181 (= lt!162686 (lemmaIsPrefixTransitive!0 (_2!4701 lt!162184) (_2!4701 lt!162662) (_2!4701 lt!162689)))))

(declare-fun call!1371 () Bool)

(assert (=> b!108181 call!1371))

(declare-fun lt!162652 () Unit!6610)

(assert (=> b!108181 (= lt!162652 lt!162686)))

(assert (=> b!108181 (invariant!0 (currentBit!5159 (_2!4701 lt!162184)) (currentByte!5164 (_2!4701 lt!162184)) (size!2246 (buf!2634 (_2!4701 lt!162662))))))

(declare-fun lt!162661 () BitStream!3966)

(assert (=> b!108181 (= lt!162661 (BitStream!3967 (buf!2634 (_2!4701 lt!162662)) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(assert (=> b!108181 (invariant!0 (currentBit!5159 lt!162661) (currentByte!5164 lt!162661) (size!2246 (buf!2634 (_2!4701 lt!162689))))))

(declare-fun lt!162650 () BitStream!3966)

(assert (=> b!108181 (= lt!162650 (BitStream!3967 (buf!2634 (_2!4701 lt!162689)) (currentByte!5164 lt!162661) (currentBit!5159 lt!162661)))))

(assert (=> b!108181 (= lt!162663 (readBitPure!0 lt!162661))))

(assert (=> b!108181 (= lt!162659 (readBitPure!0 lt!162650))))

(declare-fun lt!162654 () Unit!6610)

(assert (=> b!108181 (= lt!162654 (readBitPrefixLemma!0 lt!162661 (_2!4701 lt!162689)))))

(declare-fun res!89163 () Bool)

(assert (=> b!108181 (= res!89163 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162663))) (currentByte!5164 (_1!4702 lt!162663)) (currentBit!5159 (_1!4702 lt!162663))) (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162659))) (currentByte!5164 (_1!4702 lt!162659)) (currentBit!5159 (_1!4702 lt!162659)))))))

(assert (=> b!108181 (=> (not res!89163) (not e!70784))))

(assert (=> b!108181 e!70784))

(declare-fun lt!162660 () Unit!6610)

(assert (=> b!108181 (= lt!162660 lt!162654)))

(declare-fun lt!162684 () tuple2!8892)

(assert (=> b!108181 (= lt!162684 (reader!0 (_2!4701 lt!162184) (_2!4701 lt!162689)))))

(declare-fun lt!162658 () tuple2!8892)

(assert (=> b!108181 (= lt!162658 (reader!0 (_2!4701 lt!162662) (_2!4701 lt!162689)))))

(declare-fun lt!162681 () tuple2!8890)

(assert (=> b!108181 (= lt!162681 (readBitPure!0 (_1!4703 lt!162684)))))

(assert (=> b!108181 (= (_2!4702 lt!162681) lt!162675)))

(declare-fun lt!162688 () Unit!6610)

(declare-fun Unit!6615 () Unit!6610)

(assert (=> b!108181 (= lt!162688 Unit!6615)))

(declare-fun lt!162687 () (_ BitVec 64))

(assert (=> b!108181 (= lt!162687 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!162664 () (_ BitVec 64))

(assert (=> b!108181 (= lt!162664 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!162646 () Unit!6610)

(assert (=> b!108181 (= lt!162646 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4701 lt!162184) (buf!2634 (_2!4701 lt!162689)) lt!162664))))

(assert (=> b!108181 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162689)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184))) lt!162664)))

(declare-fun lt!162683 () Unit!6610)

(assert (=> b!108181 (= lt!162683 lt!162646)))

(declare-fun lt!162680 () tuple2!8894)

(assert (=> b!108181 (= lt!162680 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162684) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162687))))

(declare-fun lt!162649 () (_ BitVec 64))

(assert (=> b!108181 (= lt!162649 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!162656 () Unit!6610)

(assert (=> b!108181 (= lt!162656 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4701 lt!162662) (buf!2634 (_2!4701 lt!162689)) lt!162649))))

(assert (=> b!108181 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162689)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162662))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162662))) lt!162649)))

(declare-fun lt!162679 () Unit!6610)

(assert (=> b!108181 (= lt!162679 lt!162656)))

(declare-fun lt!162685 () tuple2!8894)

(assert (=> b!108181 (= lt!162685 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162658) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!162687 (ite (_2!4702 lt!162681) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!162648 () tuple2!8894)

(assert (=> b!108181 (= lt!162648 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162684) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162687))))

(declare-fun c!6671 () Bool)

(assert (=> b!108181 (= c!6671 (_2!4702 (readBitPure!0 (_1!4703 lt!162684))))))

(declare-fun e!70787 () (_ BitVec 64))

(declare-fun lt!162682 () tuple2!8894)

(assert (=> b!108181 (= lt!162682 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4703 lt!162684) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!162687 e!70787)))))

(declare-fun lt!162678 () Unit!6610)

(assert (=> b!108181 (= lt!162678 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4703 lt!162684) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162687))))

(assert (=> b!108181 (and (= (_2!4704 lt!162648) (_2!4704 lt!162682)) (= (_1!4704 lt!162648) (_1!4704 lt!162682)))))

(declare-fun lt!162670 () Unit!6610)

(assert (=> b!108181 (= lt!162670 lt!162678)))

(assert (=> b!108181 (= (_1!4703 lt!162684) (withMovedBitIndex!0 (_2!4703 lt!162684) (bvsub (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))) (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162689))) (currentByte!5164 (_2!4701 lt!162689)) (currentBit!5159 (_2!4701 lt!162689))))))))

(declare-fun lt!162690 () Unit!6610)

(declare-fun Unit!6616 () Unit!6610)

(assert (=> b!108181 (= lt!162690 Unit!6616)))

(assert (=> b!108181 (= (_1!4703 lt!162658) (withMovedBitIndex!0 (_2!4703 lt!162658) (bvsub (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162662))) (currentByte!5164 (_2!4701 lt!162662)) (currentBit!5159 (_2!4701 lt!162662))) (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162689))) (currentByte!5164 (_2!4701 lt!162689)) (currentBit!5159 (_2!4701 lt!162689))))))))

(declare-fun lt!162655 () Unit!6610)

(declare-fun Unit!6617 () Unit!6610)

(assert (=> b!108181 (= lt!162655 Unit!6617)))

(assert (=> b!108181 (= (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))) (bvsub (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162662))) (currentByte!5164 (_2!4701 lt!162662)) (currentBit!5159 (_2!4701 lt!162662))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!162671 () Unit!6610)

(declare-fun Unit!6618 () Unit!6610)

(assert (=> b!108181 (= lt!162671 Unit!6618)))

(assert (=> b!108181 (= (_2!4704 lt!162680) (_2!4704 lt!162685))))

(declare-fun lt!162672 () Unit!6610)

(declare-fun Unit!6619 () Unit!6610)

(assert (=> b!108181 (= lt!162672 Unit!6619)))

(assert (=> b!108181 (= (_1!4704 lt!162680) (_2!4703 lt!162684))))

(declare-fun b!108182 () Bool)

(declare-fun e!70790 () Bool)

(declare-fun lt!162669 () tuple2!8890)

(assert (=> b!108182 (= e!70790 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162669))) (currentByte!5164 (_1!4702 lt!162669)) (currentBit!5159 (_1!4702 lt!162669))) (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162665))) (currentByte!5164 (_2!4701 lt!162665)) (currentBit!5159 (_2!4701 lt!162665)))))))

(declare-fun bm!1368 () Bool)

(declare-fun lt!162676 () BitStream!3966)

(assert (=> bm!1368 (= call!1371 (isPrefixOf!0 (ite c!6670 (_2!4701 lt!162184) lt!162676) (ite c!6670 (_2!4701 lt!162689) lt!162676)))))

(declare-fun b!108183 () Bool)

(declare-fun lt!162677 () Unit!6610)

(assert (=> b!108183 (= e!70788 (tuple2!8889 lt!162677 (_2!4701 lt!162184)))))

(assert (=> b!108183 (= lt!162676 (_2!4701 lt!162184))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3966) Unit!6610)

(assert (=> b!108183 (= lt!162677 (lemmaIsPrefixRefl!0 lt!162676))))

(assert (=> b!108183 call!1371))

(declare-fun b!108184 () Bool)

(assert (=> b!108184 (= e!70787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!108185 () Bool)

(declare-fun lt!162653 () tuple2!8894)

(declare-fun lt!162667 () tuple2!8892)

(assert (=> b!108185 (= e!70789 (and (= (_2!4704 lt!162653) v!199) (= (_1!4704 lt!162653) (_2!4703 lt!162667))))))

(declare-fun lt!162673 () (_ BitVec 64))

(assert (=> b!108185 (= lt!162653 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162667) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162673))))

(declare-fun lt!162668 () Unit!6610)

(declare-fun lt!162657 () Unit!6610)

(assert (=> b!108185 (= lt!162668 lt!162657)))

(declare-fun lt!162674 () (_ BitVec 64))

(assert (=> b!108185 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162647)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184))) lt!162674)))

(assert (=> b!108185 (= lt!162657 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4701 lt!162184) (buf!2634 (_2!4701 lt!162647)) lt!162674))))

(declare-fun e!70785 () Bool)

(assert (=> b!108185 e!70785))

(declare-fun res!89167 () Bool)

(assert (=> b!108185 (=> (not res!89167) (not e!70785))))

(assert (=> b!108185 (= res!89167 (and (= (size!2246 (buf!2634 (_2!4701 lt!162184))) (size!2246 (buf!2634 (_2!4701 lt!162647)))) (bvsge lt!162674 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108185 (= lt!162674 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!108185 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108185 (= lt!162673 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!108185 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!108185 (= lt!162667 (reader!0 (_2!4701 lt!162184) (_2!4701 lt!162647)))))

(declare-fun b!108186 () Bool)

(assert (=> b!108186 (= lt!162669 (readBitPure!0 (readerFrom!0 (_2!4701 lt!162665) (currentBit!5159 (_2!4701 lt!162184)) (currentByte!5164 (_2!4701 lt!162184)))))))

(declare-fun res!89162 () Bool)

(assert (=> b!108186 (= res!89162 (and (= (_2!4702 lt!162669) lt!162675) (= (_1!4702 lt!162669) (_2!4701 lt!162665))))))

(assert (=> b!108186 (=> (not res!89162) (not e!70790))))

(assert (=> b!108186 (= e!70786 e!70790)))

(declare-fun b!108187 () Bool)

(declare-fun res!89166 () Bool)

(assert (=> b!108187 (=> (not res!89166) (not e!70789))))

(assert (=> b!108187 (= res!89166 (isPrefixOf!0 (_2!4701 lt!162184) (_2!4701 lt!162647)))))

(declare-fun b!108188 () Bool)

(assert (=> b!108188 (= e!70785 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162184)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184))) lt!162674))))

(declare-fun b!108189 () Bool)

(assert (=> b!108189 (= e!70787 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!34190 c!6670) b!108181))

(assert (= (and d!34190 (not c!6670)) b!108183))

(assert (= (and b!108181 res!89169) b!108180))

(assert (= (and b!108180 res!89161) b!108179))

(assert (= (and b!108179 res!89168) b!108186))

(assert (= (and b!108186 res!89162) b!108182))

(assert (= (and b!108181 res!89163) b!108178))

(assert (= (and b!108181 c!6671) b!108189))

(assert (= (and b!108181 (not c!6671)) b!108184))

(assert (= (or b!108181 b!108183) bm!1368))

(assert (= (and d!34190 res!89165) b!108177))

(assert (= (and b!108177 res!89164) b!108187))

(assert (= (and b!108187 res!89166) b!108185))

(assert (= (and b!108185 res!89167) b!108188))

(declare-fun m!160095 () Bool)

(assert (=> b!108181 m!160095))

(declare-fun m!160097 () Bool)

(assert (=> b!108181 m!160097))

(declare-fun m!160099 () Bool)

(assert (=> b!108181 m!160099))

(declare-fun m!160101 () Bool)

(assert (=> b!108181 m!160101))

(declare-fun m!160103 () Bool)

(assert (=> b!108181 m!160103))

(declare-fun m!160105 () Bool)

(assert (=> b!108181 m!160105))

(declare-fun m!160107 () Bool)

(assert (=> b!108181 m!160107))

(declare-fun m!160109 () Bool)

(assert (=> b!108181 m!160109))

(declare-fun m!160111 () Bool)

(assert (=> b!108181 m!160111))

(declare-fun m!160113 () Bool)

(assert (=> b!108181 m!160113))

(declare-fun m!160115 () Bool)

(assert (=> b!108181 m!160115))

(declare-fun m!160117 () Bool)

(assert (=> b!108181 m!160117))

(declare-fun m!160119 () Bool)

(assert (=> b!108181 m!160119))

(declare-fun m!160121 () Bool)

(assert (=> b!108181 m!160121))

(declare-fun m!160123 () Bool)

(assert (=> b!108181 m!160123))

(declare-fun m!160125 () Bool)

(assert (=> b!108181 m!160125))

(declare-fun m!160127 () Bool)

(assert (=> b!108181 m!160127))

(assert (=> b!108181 m!160119))

(declare-fun m!160129 () Bool)

(assert (=> b!108181 m!160129))

(declare-fun m!160131 () Bool)

(assert (=> b!108181 m!160131))

(declare-fun m!160133 () Bool)

(assert (=> b!108181 m!160133))

(declare-fun m!160135 () Bool)

(assert (=> b!108181 m!160135))

(declare-fun m!160137 () Bool)

(assert (=> b!108181 m!160137))

(declare-fun m!160139 () Bool)

(assert (=> b!108181 m!160139))

(declare-fun m!160141 () Bool)

(assert (=> b!108181 m!160141))

(declare-fun m!160143 () Bool)

(assert (=> b!108181 m!160143))

(assert (=> b!108181 m!159789))

(declare-fun m!160145 () Bool)

(assert (=> b!108181 m!160145))

(declare-fun m!160147 () Bool)

(assert (=> b!108181 m!160147))

(declare-fun m!160149 () Bool)

(assert (=> b!108177 m!160149))

(assert (=> b!108177 m!159789))

(declare-fun m!160151 () Bool)

(assert (=> b!108188 m!160151))

(declare-fun m!160153 () Bool)

(assert (=> b!108179 m!160153))

(declare-fun m!160155 () Bool)

(assert (=> b!108182 m!160155))

(declare-fun m!160157 () Bool)

(assert (=> b!108182 m!160157))

(declare-fun m!160159 () Bool)

(assert (=> b!108187 m!160159))

(declare-fun m!160161 () Bool)

(assert (=> b!108186 m!160161))

(assert (=> b!108186 m!160161))

(declare-fun m!160163 () Bool)

(assert (=> b!108186 m!160163))

(assert (=> b!108185 m!160121))

(declare-fun m!160165 () Bool)

(assert (=> b!108185 m!160165))

(declare-fun m!160167 () Bool)

(assert (=> b!108185 m!160167))

(declare-fun m!160169 () Bool)

(assert (=> b!108185 m!160169))

(declare-fun m!160171 () Bool)

(assert (=> b!108185 m!160171))

(declare-fun m!160173 () Bool)

(assert (=> bm!1368 m!160173))

(assert (=> b!108180 m!160157))

(assert (=> b!108180 m!159789))

(declare-fun m!160175 () Bool)

(assert (=> b!108183 m!160175))

(assert (=> b!107995 d!34190))

(declare-fun d!34268 () Bool)

(declare-fun e!70793 () Bool)

(assert (=> d!34268 e!70793))

(declare-fun res!89172 () Bool)

(assert (=> d!34268 (=> (not res!89172) (not e!70793))))

(declare-fun lt!162701 () tuple2!8890)

(declare-fun lt!162699 () tuple2!8890)

(assert (=> d!34268 (= res!89172 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162701))) (currentByte!5164 (_1!4702 lt!162701)) (currentBit!5159 (_1!4702 lt!162701))) (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162699))) (currentByte!5164 (_1!4702 lt!162699)) (currentBit!5159 (_1!4702 lt!162699)))))))

(declare-fun lt!162702 () Unit!6610)

(declare-fun lt!162700 () BitStream!3966)

(declare-fun choose!50 (BitStream!3966 BitStream!3966 BitStream!3966 tuple2!8890 tuple2!8890 BitStream!3966 Bool tuple2!8890 tuple2!8890 BitStream!3966 Bool) Unit!6610)

(assert (=> d!34268 (= lt!162702 (choose!50 lt!162175 (_2!4701 lt!162167) lt!162700 lt!162701 (tuple2!8891 (_1!4702 lt!162701) (_2!4702 lt!162701)) (_1!4702 lt!162701) (_2!4702 lt!162701) lt!162699 (tuple2!8891 (_1!4702 lt!162699) (_2!4702 lt!162699)) (_1!4702 lt!162699) (_2!4702 lt!162699)))))

(assert (=> d!34268 (= lt!162699 (readBitPure!0 lt!162700))))

(assert (=> d!34268 (= lt!162701 (readBitPure!0 lt!162175))))

(assert (=> d!34268 (= lt!162700 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 lt!162175) (currentBit!5159 lt!162175)))))

(assert (=> d!34268 (invariant!0 (currentBit!5159 lt!162175) (currentByte!5164 lt!162175) (size!2246 (buf!2634 (_2!4701 lt!162167))))))

(assert (=> d!34268 (= (readBitPrefixLemma!0 lt!162175 (_2!4701 lt!162167)) lt!162702)))

(declare-fun b!108192 () Bool)

(assert (=> b!108192 (= e!70793 (= (_2!4702 lt!162701) (_2!4702 lt!162699)))))

(assert (= (and d!34268 res!89172) b!108192))

(declare-fun m!160177 () Bool)

(assert (=> d!34268 m!160177))

(declare-fun m!160179 () Bool)

(assert (=> d!34268 m!160179))

(declare-fun m!160181 () Bool)

(assert (=> d!34268 m!160181))

(declare-fun m!160183 () Bool)

(assert (=> d!34268 m!160183))

(declare-fun m!160185 () Bool)

(assert (=> d!34268 m!160185))

(assert (=> d!34268 m!159803))

(assert (=> b!107995 d!34268))

(declare-fun d!34270 () Bool)

(assert (=> d!34270 (isPrefixOf!0 thiss!1305 (_2!4701 lt!162167))))

(declare-fun lt!162705 () Unit!6610)

(declare-fun choose!30 (BitStream!3966 BitStream!3966 BitStream!3966) Unit!6610)

(assert (=> d!34270 (= lt!162705 (choose!30 thiss!1305 (_2!4701 lt!162184) (_2!4701 lt!162167)))))

(assert (=> d!34270 (isPrefixOf!0 thiss!1305 (_2!4701 lt!162184))))

(assert (=> d!34270 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4701 lt!162184) (_2!4701 lt!162167)) lt!162705)))

(declare-fun bs!8350 () Bool)

(assert (= bs!8350 d!34270))

(assert (=> bs!8350 m!159813))

(declare-fun m!160187 () Bool)

(assert (=> bs!8350 m!160187))

(assert (=> bs!8350 m!159771))

(assert (=> b!107995 d!34270))

(declare-fun d!34272 () Bool)

(assert (=> d!34272 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305)) lt!162183)))

(declare-fun lt!162708 () Unit!6610)

(declare-fun choose!9 (BitStream!3966 array!4936 (_ BitVec 64) BitStream!3966) Unit!6610)

(assert (=> d!34272 (= lt!162708 (choose!9 thiss!1305 (buf!2634 (_2!4701 lt!162167)) lt!162183 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305))))))

(assert (=> d!34272 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2634 (_2!4701 lt!162167)) lt!162183) lt!162708)))

(declare-fun bs!8351 () Bool)

(assert (= bs!8351 d!34272))

(assert (=> bs!8351 m!159811))

(declare-fun m!160189 () Bool)

(assert (=> bs!8351 m!160189))

(assert (=> b!107995 d!34272))

(declare-datatypes ((tuple2!8906 0))(
  ( (tuple2!8907 (_1!4710 (_ BitVec 64)) (_2!4710 BitStream!3966)) )
))
(declare-fun lt!162711 () tuple2!8906)

(declare-fun d!34274 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8906)

(assert (=> d!34274 (= lt!162711 (readNLeastSignificantBitsLoop!0 (_1!4703 lt!162179) nBits!396 i!615 lt!162186))))

(assert (=> d!34274 (= (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162179) nBits!396 i!615 lt!162186) (tuple2!8895 (_2!4710 lt!162711) (_1!4710 lt!162711)))))

(declare-fun bs!8352 () Bool)

(assert (= bs!8352 d!34274))

(declare-fun m!160191 () Bool)

(assert (=> bs!8352 m!160191))

(assert (=> b!107995 d!34274))

(declare-fun d!34276 () Bool)

(declare-fun lt!162712 () tuple2!8904)

(assert (=> d!34276 (= lt!162712 (readBit!0 lt!162175))))

(assert (=> d!34276 (= (readBitPure!0 lt!162175) (tuple2!8891 (_2!4709 lt!162712) (_1!4709 lt!162712)))))

(declare-fun bs!8353 () Bool)

(assert (= bs!8353 d!34276))

(declare-fun m!160193 () Bool)

(assert (=> bs!8353 m!160193))

(assert (=> b!107995 d!34276))

(declare-fun d!34278 () Bool)

(assert (=> d!34278 (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184))) lt!162168)))

(declare-fun lt!162713 () Unit!6610)

(assert (=> d!34278 (= lt!162713 (choose!9 (_2!4701 lt!162184) (buf!2634 (_2!4701 lt!162167)) lt!162168 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184)))))))

(assert (=> d!34278 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4701 lt!162184) (buf!2634 (_2!4701 lt!162167)) lt!162168) lt!162713)))

(declare-fun bs!8354 () Bool)

(assert (= bs!8354 d!34278))

(assert (=> bs!8354 m!159827))

(declare-fun m!160195 () Bool)

(assert (=> bs!8354 m!160195))

(assert (=> b!107995 d!34278))

(declare-fun b!108203 () Bool)

(declare-fun e!70798 () Unit!6610)

(declare-fun Unit!6620 () Unit!6610)

(assert (=> b!108203 (= e!70798 Unit!6620)))

(declare-fun d!34280 () Bool)

(declare-fun e!70799 () Bool)

(assert (=> d!34280 e!70799))

(declare-fun res!89181 () Bool)

(assert (=> d!34280 (=> (not res!89181) (not e!70799))))

(declare-fun lt!162761 () tuple2!8892)

(assert (=> d!34280 (= res!89181 (isPrefixOf!0 (_1!4703 lt!162761) (_2!4703 lt!162761)))))

(declare-fun lt!162771 () BitStream!3966)

(assert (=> d!34280 (= lt!162761 (tuple2!8893 lt!162771 (_2!4701 lt!162167)))))

(declare-fun lt!162756 () Unit!6610)

(declare-fun lt!162764 () Unit!6610)

(assert (=> d!34280 (= lt!162756 lt!162764)))

(assert (=> d!34280 (isPrefixOf!0 lt!162771 (_2!4701 lt!162167))))

(assert (=> d!34280 (= lt!162764 (lemmaIsPrefixTransitive!0 lt!162771 (_2!4701 lt!162167) (_2!4701 lt!162167)))))

(declare-fun lt!162765 () Unit!6610)

(declare-fun lt!162766 () Unit!6610)

(assert (=> d!34280 (= lt!162765 lt!162766)))

(assert (=> d!34280 (isPrefixOf!0 lt!162771 (_2!4701 lt!162167))))

(assert (=> d!34280 (= lt!162766 (lemmaIsPrefixTransitive!0 lt!162771 (_2!4701 lt!162184) (_2!4701 lt!162167)))))

(declare-fun lt!162769 () Unit!6610)

(assert (=> d!34280 (= lt!162769 e!70798)))

(declare-fun c!6674 () Bool)

(assert (=> d!34280 (= c!6674 (not (= (size!2246 (buf!2634 (_2!4701 lt!162184))) #b00000000000000000000000000000000)))))

(declare-fun lt!162768 () Unit!6610)

(declare-fun lt!162760 () Unit!6610)

(assert (=> d!34280 (= lt!162768 lt!162760)))

(assert (=> d!34280 (isPrefixOf!0 (_2!4701 lt!162167) (_2!4701 lt!162167))))

(assert (=> d!34280 (= lt!162760 (lemmaIsPrefixRefl!0 (_2!4701 lt!162167)))))

(declare-fun lt!162763 () Unit!6610)

(declare-fun lt!162770 () Unit!6610)

(assert (=> d!34280 (= lt!162763 lt!162770)))

(assert (=> d!34280 (= lt!162770 (lemmaIsPrefixRefl!0 (_2!4701 lt!162167)))))

(declare-fun lt!162758 () Unit!6610)

(declare-fun lt!162757 () Unit!6610)

(assert (=> d!34280 (= lt!162758 lt!162757)))

(assert (=> d!34280 (isPrefixOf!0 lt!162771 lt!162771)))

(assert (=> d!34280 (= lt!162757 (lemmaIsPrefixRefl!0 lt!162771))))

(declare-fun lt!162754 () Unit!6610)

(declare-fun lt!162767 () Unit!6610)

(assert (=> d!34280 (= lt!162754 lt!162767)))

(assert (=> d!34280 (isPrefixOf!0 (_2!4701 lt!162184) (_2!4701 lt!162184))))

(assert (=> d!34280 (= lt!162767 (lemmaIsPrefixRefl!0 (_2!4701 lt!162184)))))

(assert (=> d!34280 (= lt!162771 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(assert (=> d!34280 (isPrefixOf!0 (_2!4701 lt!162184) (_2!4701 lt!162167))))

(assert (=> d!34280 (= (reader!0 (_2!4701 lt!162184) (_2!4701 lt!162167)) lt!162761)))

(declare-fun b!108204 () Bool)

(declare-fun res!89179 () Bool)

(assert (=> b!108204 (=> (not res!89179) (not e!70799))))

(assert (=> b!108204 (= res!89179 (isPrefixOf!0 (_1!4703 lt!162761) (_2!4701 lt!162184)))))

(declare-fun lt!162762 () (_ BitVec 64))

(declare-fun b!108205 () Bool)

(declare-fun lt!162755 () (_ BitVec 64))

(assert (=> b!108205 (= e!70799 (= (_1!4703 lt!162761) (withMovedBitIndex!0 (_2!4703 lt!162761) (bvsub lt!162755 lt!162762))))))

(assert (=> b!108205 (or (= (bvand lt!162755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162755 lt!162762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108205 (= lt!162762 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162167))) (currentByte!5164 (_2!4701 lt!162167)) (currentBit!5159 (_2!4701 lt!162167))))))

(assert (=> b!108205 (= lt!162755 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(declare-fun b!108206 () Bool)

(declare-fun res!89180 () Bool)

(assert (=> b!108206 (=> (not res!89180) (not e!70799))))

(assert (=> b!108206 (= res!89180 (isPrefixOf!0 (_2!4703 lt!162761) (_2!4701 lt!162167)))))

(declare-fun b!108207 () Bool)

(declare-fun lt!162772 () Unit!6610)

(assert (=> b!108207 (= e!70798 lt!162772)))

(declare-fun lt!162759 () (_ BitVec 64))

(assert (=> b!108207 (= lt!162759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162773 () (_ BitVec 64))

(assert (=> b!108207 (= lt!162773 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4936 array!4936 (_ BitVec 64) (_ BitVec 64)) Unit!6610)

(assert (=> b!108207 (= lt!162772 (arrayBitRangesEqSymmetric!0 (buf!2634 (_2!4701 lt!162184)) (buf!2634 (_2!4701 lt!162167)) lt!162759 lt!162773))))

(assert (=> b!108207 (arrayBitRangesEq!0 (buf!2634 (_2!4701 lt!162167)) (buf!2634 (_2!4701 lt!162184)) lt!162759 lt!162773)))

(assert (= (and d!34280 c!6674) b!108207))

(assert (= (and d!34280 (not c!6674)) b!108203))

(assert (= (and d!34280 res!89181) b!108204))

(assert (= (and b!108204 res!89179) b!108206))

(assert (= (and b!108206 res!89180) b!108205))

(declare-fun m!160197 () Bool)

(assert (=> b!108206 m!160197))

(declare-fun m!160199 () Bool)

(assert (=> b!108204 m!160199))

(assert (=> b!108207 m!159789))

(declare-fun m!160201 () Bool)

(assert (=> b!108207 m!160201))

(declare-fun m!160203 () Bool)

(assert (=> b!108207 m!160203))

(declare-fun m!160205 () Bool)

(assert (=> d!34280 m!160205))

(declare-fun m!160207 () Bool)

(assert (=> d!34280 m!160207))

(declare-fun m!160209 () Bool)

(assert (=> d!34280 m!160209))

(declare-fun m!160211 () Bool)

(assert (=> d!34280 m!160211))

(declare-fun m!160213 () Bool)

(assert (=> d!34280 m!160213))

(declare-fun m!160215 () Bool)

(assert (=> d!34280 m!160215))

(declare-fun m!160217 () Bool)

(assert (=> d!34280 m!160217))

(declare-fun m!160219 () Bool)

(assert (=> d!34280 m!160219))

(declare-fun m!160221 () Bool)

(assert (=> d!34280 m!160221))

(declare-fun m!160223 () Bool)

(assert (=> d!34280 m!160223))

(declare-fun m!160225 () Bool)

(assert (=> d!34280 m!160225))

(declare-fun m!160227 () Bool)

(assert (=> b!108205 m!160227))

(assert (=> b!108205 m!159785))

(assert (=> b!108205 m!159789))

(assert (=> b!107995 d!34280))

(declare-fun b!108208 () Bool)

(declare-fun e!70800 () Unit!6610)

(declare-fun Unit!6621 () Unit!6610)

(assert (=> b!108208 (= e!70800 Unit!6621)))

(declare-fun d!34282 () Bool)

(declare-fun e!70801 () Bool)

(assert (=> d!34282 e!70801))

(declare-fun res!89184 () Bool)

(assert (=> d!34282 (=> (not res!89184) (not e!70801))))

(declare-fun lt!162781 () tuple2!8892)

(assert (=> d!34282 (= res!89184 (isPrefixOf!0 (_1!4703 lt!162781) (_2!4703 lt!162781)))))

(declare-fun lt!162791 () BitStream!3966)

(assert (=> d!34282 (= lt!162781 (tuple2!8893 lt!162791 (_2!4701 lt!162167)))))

(declare-fun lt!162776 () Unit!6610)

(declare-fun lt!162784 () Unit!6610)

(assert (=> d!34282 (= lt!162776 lt!162784)))

(assert (=> d!34282 (isPrefixOf!0 lt!162791 (_2!4701 lt!162167))))

(assert (=> d!34282 (= lt!162784 (lemmaIsPrefixTransitive!0 lt!162791 (_2!4701 lt!162167) (_2!4701 lt!162167)))))

(declare-fun lt!162785 () Unit!6610)

(declare-fun lt!162786 () Unit!6610)

(assert (=> d!34282 (= lt!162785 lt!162786)))

(assert (=> d!34282 (isPrefixOf!0 lt!162791 (_2!4701 lt!162167))))

(assert (=> d!34282 (= lt!162786 (lemmaIsPrefixTransitive!0 lt!162791 thiss!1305 (_2!4701 lt!162167)))))

(declare-fun lt!162789 () Unit!6610)

(assert (=> d!34282 (= lt!162789 e!70800)))

(declare-fun c!6675 () Bool)

(assert (=> d!34282 (= c!6675 (not (= (size!2246 (buf!2634 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!162788 () Unit!6610)

(declare-fun lt!162780 () Unit!6610)

(assert (=> d!34282 (= lt!162788 lt!162780)))

(assert (=> d!34282 (isPrefixOf!0 (_2!4701 lt!162167) (_2!4701 lt!162167))))

(assert (=> d!34282 (= lt!162780 (lemmaIsPrefixRefl!0 (_2!4701 lt!162167)))))

(declare-fun lt!162783 () Unit!6610)

(declare-fun lt!162790 () Unit!6610)

(assert (=> d!34282 (= lt!162783 lt!162790)))

(assert (=> d!34282 (= lt!162790 (lemmaIsPrefixRefl!0 (_2!4701 lt!162167)))))

(declare-fun lt!162778 () Unit!6610)

(declare-fun lt!162777 () Unit!6610)

(assert (=> d!34282 (= lt!162778 lt!162777)))

(assert (=> d!34282 (isPrefixOf!0 lt!162791 lt!162791)))

(assert (=> d!34282 (= lt!162777 (lemmaIsPrefixRefl!0 lt!162791))))

(declare-fun lt!162774 () Unit!6610)

(declare-fun lt!162787 () Unit!6610)

(assert (=> d!34282 (= lt!162774 lt!162787)))

(assert (=> d!34282 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34282 (= lt!162787 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34282 (= lt!162791 (BitStream!3967 (buf!2634 (_2!4701 lt!162167)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(assert (=> d!34282 (isPrefixOf!0 thiss!1305 (_2!4701 lt!162167))))

(assert (=> d!34282 (= (reader!0 thiss!1305 (_2!4701 lt!162167)) lt!162781)))

(declare-fun b!108209 () Bool)

(declare-fun res!89182 () Bool)

(assert (=> b!108209 (=> (not res!89182) (not e!70801))))

(assert (=> b!108209 (= res!89182 (isPrefixOf!0 (_1!4703 lt!162781) thiss!1305))))

(declare-fun lt!162782 () (_ BitVec 64))

(declare-fun lt!162775 () (_ BitVec 64))

(declare-fun b!108210 () Bool)

(assert (=> b!108210 (= e!70801 (= (_1!4703 lt!162781) (withMovedBitIndex!0 (_2!4703 lt!162781) (bvsub lt!162775 lt!162782))))))

(assert (=> b!108210 (or (= (bvand lt!162775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162775 lt!162782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108210 (= lt!162782 (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162167))) (currentByte!5164 (_2!4701 lt!162167)) (currentBit!5159 (_2!4701 lt!162167))))))

(assert (=> b!108210 (= lt!162775 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(declare-fun b!108211 () Bool)

(declare-fun res!89183 () Bool)

(assert (=> b!108211 (=> (not res!89183) (not e!70801))))

(assert (=> b!108211 (= res!89183 (isPrefixOf!0 (_2!4703 lt!162781) (_2!4701 lt!162167)))))

(declare-fun b!108212 () Bool)

(declare-fun lt!162792 () Unit!6610)

(assert (=> b!108212 (= e!70800 lt!162792)))

(declare-fun lt!162779 () (_ BitVec 64))

(assert (=> b!108212 (= lt!162779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162793 () (_ BitVec 64))

(assert (=> b!108212 (= lt!162793 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(assert (=> b!108212 (= lt!162792 (arrayBitRangesEqSymmetric!0 (buf!2634 thiss!1305) (buf!2634 (_2!4701 lt!162167)) lt!162779 lt!162793))))

(assert (=> b!108212 (arrayBitRangesEq!0 (buf!2634 (_2!4701 lt!162167)) (buf!2634 thiss!1305) lt!162779 lt!162793)))

(assert (= (and d!34282 c!6675) b!108212))

(assert (= (and d!34282 (not c!6675)) b!108208))

(assert (= (and d!34282 res!89184) b!108209))

(assert (= (and b!108209 res!89182) b!108211))

(assert (= (and b!108211 res!89183) b!108210))

(declare-fun m!160229 () Bool)

(assert (=> b!108211 m!160229))

(declare-fun m!160231 () Bool)

(assert (=> b!108209 m!160231))

(assert (=> b!108212 m!159793))

(declare-fun m!160233 () Bool)

(assert (=> b!108212 m!160233))

(declare-fun m!160235 () Bool)

(assert (=> b!108212 m!160235))

(declare-fun m!160237 () Bool)

(assert (=> d!34282 m!160237))

(assert (=> d!34282 m!159813))

(declare-fun m!160239 () Bool)

(assert (=> d!34282 m!160239))

(declare-fun m!160241 () Bool)

(assert (=> d!34282 m!160241))

(declare-fun m!160243 () Bool)

(assert (=> d!34282 m!160243))

(declare-fun m!160245 () Bool)

(assert (=> d!34282 m!160245))

(declare-fun m!160247 () Bool)

(assert (=> d!34282 m!160247))

(declare-fun m!160249 () Bool)

(assert (=> d!34282 m!160249))

(declare-fun m!160251 () Bool)

(assert (=> d!34282 m!160251))

(assert (=> d!34282 m!160223))

(assert (=> d!34282 m!160225))

(declare-fun m!160253 () Bool)

(assert (=> b!108210 m!160253))

(assert (=> b!108210 m!159785))

(assert (=> b!108210 m!159793))

(assert (=> b!107995 d!34282))

(declare-fun lt!162794 () tuple2!8906)

(declare-fun d!34284 () Bool)

(assert (=> d!34284 (= lt!162794 (readNLeastSignificantBitsLoop!0 (_1!4703 lt!162191) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162170))))

(assert (=> d!34284 (= (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162191) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162170) (tuple2!8895 (_2!4710 lt!162794) (_1!4710 lt!162794)))))

(declare-fun bs!8355 () Bool)

(assert (= bs!8355 d!34284))

(declare-fun m!160255 () Bool)

(assert (=> bs!8355 m!160255))

(assert (=> b!107995 d!34284))

(declare-fun d!34286 () Bool)

(declare-fun e!70802 () Bool)

(assert (=> d!34286 e!70802))

(declare-fun res!89186 () Bool)

(assert (=> d!34286 (=> (not res!89186) (not e!70802))))

(declare-fun lt!162795 () (_ BitVec 64))

(declare-fun lt!162798 () (_ BitVec 64))

(declare-fun lt!162796 () (_ BitVec 64))

(assert (=> d!34286 (= res!89186 (= lt!162796 (bvsub lt!162798 lt!162795)))))

(assert (=> d!34286 (or (= (bvand lt!162798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162798 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162798 lt!162795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34286 (= lt!162795 (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162194)))) ((_ sign_extend 32) (currentByte!5164 (_1!4702 lt!162194))) ((_ sign_extend 32) (currentBit!5159 (_1!4702 lt!162194)))))))

(declare-fun lt!162800 () (_ BitVec 64))

(declare-fun lt!162799 () (_ BitVec 64))

(assert (=> d!34286 (= lt!162798 (bvmul lt!162800 lt!162799))))

(assert (=> d!34286 (or (= lt!162800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162799 (bvsdiv (bvmul lt!162800 lt!162799) lt!162800)))))

(assert (=> d!34286 (= lt!162799 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34286 (= lt!162800 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162194)))))))

(assert (=> d!34286 (= lt!162796 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5164 (_1!4702 lt!162194))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5159 (_1!4702 lt!162194)))))))

(assert (=> d!34286 (invariant!0 (currentBit!5159 (_1!4702 lt!162194)) (currentByte!5164 (_1!4702 lt!162194)) (size!2246 (buf!2634 (_1!4702 lt!162194))))))

(assert (=> d!34286 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162194))) (currentByte!5164 (_1!4702 lt!162194)) (currentBit!5159 (_1!4702 lt!162194))) lt!162796)))

(declare-fun b!108213 () Bool)

(declare-fun res!89185 () Bool)

(assert (=> b!108213 (=> (not res!89185) (not e!70802))))

(assert (=> b!108213 (= res!89185 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162796))))

(declare-fun b!108214 () Bool)

(declare-fun lt!162797 () (_ BitVec 64))

(assert (=> b!108214 (= e!70802 (bvsle lt!162796 (bvmul lt!162797 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108214 (or (= lt!162797 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162797 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162797)))))

(assert (=> b!108214 (= lt!162797 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162194)))))))

(assert (= (and d!34286 res!89186) b!108213))

(assert (= (and b!108213 res!89185) b!108214))

(declare-fun m!160257 () Bool)

(assert (=> d!34286 m!160257))

(declare-fun m!160259 () Bool)

(assert (=> d!34286 m!160259))

(assert (=> b!107995 d!34286))

(declare-fun d!34288 () Bool)

(assert (=> d!34288 (= (invariant!0 (currentBit!5159 (_2!4701 lt!162167)) (currentByte!5164 (_2!4701 lt!162167)) (size!2246 (buf!2634 (_2!4701 lt!162167)))) (and (bvsge (currentBit!5159 (_2!4701 lt!162167)) #b00000000000000000000000000000000) (bvslt (currentBit!5159 (_2!4701 lt!162167)) #b00000000000000000000000000001000) (bvsge (currentByte!5164 (_2!4701 lt!162167)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5164 (_2!4701 lt!162167)) (size!2246 (buf!2634 (_2!4701 lt!162167)))) (and (= (currentBit!5159 (_2!4701 lt!162167)) #b00000000000000000000000000000000) (= (currentByte!5164 (_2!4701 lt!162167)) (size!2246 (buf!2634 (_2!4701 lt!162167))))))))))

(assert (=> b!107985 d!34288))

(declare-fun d!34290 () Bool)

(assert (=> d!34290 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305)) lt!162183) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305))) lt!162183))))

(declare-fun bs!8356 () Bool)

(assert (= bs!8356 d!34290))

(declare-fun m!160261 () Bool)

(assert (=> bs!8356 m!160261))

(assert (=> b!107996 d!34290))

(declare-fun d!34292 () Bool)

(declare-fun e!70803 () Bool)

(assert (=> d!34292 e!70803))

(declare-fun res!89188 () Bool)

(assert (=> d!34292 (=> (not res!89188) (not e!70803))))

(declare-fun lt!162801 () (_ BitVec 64))

(declare-fun lt!162802 () (_ BitVec 64))

(declare-fun lt!162804 () (_ BitVec 64))

(assert (=> d!34292 (= res!89188 (= lt!162802 (bvsub lt!162804 lt!162801)))))

(assert (=> d!34292 (or (= (bvand lt!162804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162801 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162804 lt!162801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34292 (= lt!162801 (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162192)))) ((_ sign_extend 32) (currentByte!5164 (_1!4702 lt!162192))) ((_ sign_extend 32) (currentBit!5159 (_1!4702 lt!162192)))))))

(declare-fun lt!162806 () (_ BitVec 64))

(declare-fun lt!162805 () (_ BitVec 64))

(assert (=> d!34292 (= lt!162804 (bvmul lt!162806 lt!162805))))

(assert (=> d!34292 (or (= lt!162806 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162805 (bvsdiv (bvmul lt!162806 lt!162805) lt!162806)))))

(assert (=> d!34292 (= lt!162805 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34292 (= lt!162806 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162192)))))))

(assert (=> d!34292 (= lt!162802 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5164 (_1!4702 lt!162192))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5159 (_1!4702 lt!162192)))))))

(assert (=> d!34292 (invariant!0 (currentBit!5159 (_1!4702 lt!162192)) (currentByte!5164 (_1!4702 lt!162192)) (size!2246 (buf!2634 (_1!4702 lt!162192))))))

(assert (=> d!34292 (= (bitIndex!0 (size!2246 (buf!2634 (_1!4702 lt!162192))) (currentByte!5164 (_1!4702 lt!162192)) (currentBit!5159 (_1!4702 lt!162192))) lt!162802)))

(declare-fun b!108215 () Bool)

(declare-fun res!89187 () Bool)

(assert (=> b!108215 (=> (not res!89187) (not e!70803))))

(assert (=> b!108215 (= res!89187 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162802))))

(declare-fun b!108216 () Bool)

(declare-fun lt!162803 () (_ BitVec 64))

(assert (=> b!108216 (= e!70803 (bvsle lt!162802 (bvmul lt!162803 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108216 (or (= lt!162803 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162803 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162803)))))

(assert (=> b!108216 (= lt!162803 ((_ sign_extend 32) (size!2246 (buf!2634 (_1!4702 lt!162192)))))))

(assert (= (and d!34292 res!89188) b!108215))

(assert (= (and b!108215 res!89187) b!108216))

(declare-fun m!160263 () Bool)

(assert (=> d!34292 m!160263))

(declare-fun m!160265 () Bool)

(assert (=> d!34292 m!160265))

(assert (=> b!107986 d!34292))

(declare-fun d!34294 () Bool)

(declare-fun lt!162807 () tuple2!8904)

(assert (=> d!34294 (= lt!162807 (readBit!0 (readerFrom!0 (_2!4701 lt!162184) (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305))))))

(assert (=> d!34294 (= (readBitPure!0 (readerFrom!0 (_2!4701 lt!162184) (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305))) (tuple2!8891 (_2!4709 lt!162807) (_1!4709 lt!162807)))))

(declare-fun bs!8357 () Bool)

(assert (= bs!8357 d!34294))

(assert (=> bs!8357 m!159777))

(declare-fun m!160267 () Bool)

(assert (=> bs!8357 m!160267))

(assert (=> b!107997 d!34294))

(declare-fun d!34296 () Bool)

(declare-fun e!70806 () Bool)

(assert (=> d!34296 e!70806))

(declare-fun res!89192 () Bool)

(assert (=> d!34296 (=> (not res!89192) (not e!70806))))

(assert (=> d!34296 (= res!89192 (invariant!0 (currentBit!5159 (_2!4701 lt!162184)) (currentByte!5164 (_2!4701 lt!162184)) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(assert (=> d!34296 (= (readerFrom!0 (_2!4701 lt!162184) (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305)) (BitStream!3967 (buf!2634 (_2!4701 lt!162184)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)))))

(declare-fun b!108219 () Bool)

(assert (=> b!108219 (= e!70806 (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(assert (= (and d!34296 res!89192) b!108219))

(declare-fun m!160269 () Bool)

(assert (=> d!34296 m!160269))

(assert (=> b!108219 m!159781))

(assert (=> b!107997 d!34296))

(declare-fun d!34298 () Bool)

(assert (=> d!34298 (= (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162184)))) (and (bvsge (currentBit!5159 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5159 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5164 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162184)))) (and (= (currentBit!5159 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162184))))))))))

(assert (=> b!107998 d!34298))

(declare-fun d!34300 () Bool)

(assert (=> d!34300 (= (array_inv!2048 (buf!2634 thiss!1305)) (bvsge (size!2246 (buf!2634 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107988 d!34300))

(declare-fun d!34302 () Bool)

(assert (=> d!34302 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 thiss!1305))))))

(declare-fun bs!8358 () Bool)

(assert (= bs!8358 d!34302))

(declare-fun m!160271 () Bool)

(assert (=> bs!8358 m!160271))

(assert (=> start!21468 d!34302))

(declare-fun d!34304 () Bool)

(assert (=> d!34304 (= (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162167)))) (and (bvsge (currentBit!5159 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5159 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5164 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162167)))) (and (= (currentBit!5159 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5164 thiss!1305) (size!2246 (buf!2634 (_2!4701 lt!162167))))))))))

(assert (=> b!107990 d!34304))

(declare-fun d!34306 () Bool)

(declare-fun e!70807 () Bool)

(assert (=> d!34306 e!70807))

(declare-fun res!89194 () Bool)

(assert (=> d!34306 (=> (not res!89194) (not e!70807))))

(declare-fun lt!162811 () (_ BitVec 64))

(declare-fun lt!162809 () (_ BitVec 64))

(declare-fun lt!162808 () (_ BitVec 64))

(assert (=> d!34306 (= res!89194 (= lt!162809 (bvsub lt!162811 lt!162808)))))

(assert (=> d!34306 (or (= (bvand lt!162811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162808 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162811 lt!162808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34306 (= lt!162808 (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162184)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184)))))))

(declare-fun lt!162813 () (_ BitVec 64))

(declare-fun lt!162812 () (_ BitVec 64))

(assert (=> d!34306 (= lt!162811 (bvmul lt!162813 lt!162812))))

(assert (=> d!34306 (or (= lt!162813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162812 (bvsdiv (bvmul lt!162813 lt!162812) lt!162813)))))

(assert (=> d!34306 (= lt!162812 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34306 (= lt!162813 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(assert (=> d!34306 (= lt!162809 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162184))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162184)))))))

(assert (=> d!34306 (invariant!0 (currentBit!5159 (_2!4701 lt!162184)) (currentByte!5164 (_2!4701 lt!162184)) (size!2246 (buf!2634 (_2!4701 lt!162184))))))

(assert (=> d!34306 (= (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184))) lt!162809)))

(declare-fun b!108220 () Bool)

(declare-fun res!89193 () Bool)

(assert (=> b!108220 (=> (not res!89193) (not e!70807))))

(assert (=> b!108220 (= res!89193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162809))))

(declare-fun b!108221 () Bool)

(declare-fun lt!162810 () (_ BitVec 64))

(assert (=> b!108221 (= e!70807 (bvsle lt!162809 (bvmul lt!162810 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108221 (or (= lt!162810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162810)))))

(assert (=> b!108221 (= lt!162810 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(assert (= (and d!34306 res!89194) b!108220))

(assert (= (and b!108220 res!89193) b!108221))

(declare-fun m!160273 () Bool)

(assert (=> d!34306 m!160273))

(assert (=> d!34306 m!160269))

(assert (=> b!107991 d!34306))

(declare-fun d!34308 () Bool)

(declare-fun e!70808 () Bool)

(assert (=> d!34308 e!70808))

(declare-fun res!89196 () Bool)

(assert (=> d!34308 (=> (not res!89196) (not e!70808))))

(declare-fun lt!162817 () (_ BitVec 64))

(declare-fun lt!162814 () (_ BitVec 64))

(declare-fun lt!162815 () (_ BitVec 64))

(assert (=> d!34308 (= res!89196 (= lt!162815 (bvsub lt!162817 lt!162814)))))

(assert (=> d!34308 (or (= (bvand lt!162817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162817 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162817 lt!162814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34308 (= lt!162814 (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))) ((_ sign_extend 32) (currentByte!5164 thiss!1305)) ((_ sign_extend 32) (currentBit!5159 thiss!1305))))))

(declare-fun lt!162819 () (_ BitVec 64))

(declare-fun lt!162818 () (_ BitVec 64))

(assert (=> d!34308 (= lt!162817 (bvmul lt!162819 lt!162818))))

(assert (=> d!34308 (or (= lt!162819 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162818 (bvsdiv (bvmul lt!162819 lt!162818) lt!162819)))))

(assert (=> d!34308 (= lt!162818 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34308 (= lt!162819 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))))))

(assert (=> d!34308 (= lt!162815 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5164 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5159 thiss!1305))))))

(assert (=> d!34308 (invariant!0 (currentBit!5159 thiss!1305) (currentByte!5164 thiss!1305) (size!2246 (buf!2634 thiss!1305)))))

(assert (=> d!34308 (= (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)) lt!162815)))

(declare-fun b!108222 () Bool)

(declare-fun res!89195 () Bool)

(assert (=> b!108222 (=> (not res!89195) (not e!70808))))

(assert (=> b!108222 (= res!89195 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162815))))

(declare-fun b!108223 () Bool)

(declare-fun lt!162816 () (_ BitVec 64))

(assert (=> b!108223 (= e!70808 (bvsle lt!162815 (bvmul lt!162816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108223 (or (= lt!162816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162816)))))

(assert (=> b!108223 (= lt!162816 ((_ sign_extend 32) (size!2246 (buf!2634 thiss!1305))))))

(assert (= (and d!34308 res!89196) b!108222))

(assert (= (and b!108222 res!89195) b!108223))

(assert (=> d!34308 m!160261))

(assert (=> d!34308 m!160271))

(assert (=> b!107991 d!34308))

(declare-fun d!34310 () Bool)

(declare-fun res!89199 () Bool)

(declare-fun e!70809 () Bool)

(assert (=> d!34310 (=> (not res!89199) (not e!70809))))

(assert (=> d!34310 (= res!89199 (= (size!2246 (buf!2634 thiss!1305)) (size!2246 (buf!2634 (_2!4701 lt!162184)))))))

(assert (=> d!34310 (= (isPrefixOf!0 thiss!1305 (_2!4701 lt!162184)) e!70809)))

(declare-fun b!108224 () Bool)

(declare-fun res!89198 () Bool)

(assert (=> b!108224 (=> (not res!89198) (not e!70809))))

(assert (=> b!108224 (= res!89198 (bvsle (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305)) (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162184))) (currentByte!5164 (_2!4701 lt!162184)) (currentBit!5159 (_2!4701 lt!162184)))))))

(declare-fun b!108225 () Bool)

(declare-fun e!70810 () Bool)

(assert (=> b!108225 (= e!70809 e!70810)))

(declare-fun res!89197 () Bool)

(assert (=> b!108225 (=> res!89197 e!70810)))

(assert (=> b!108225 (= res!89197 (= (size!2246 (buf!2634 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!108226 () Bool)

(assert (=> b!108226 (= e!70810 (arrayBitRangesEq!0 (buf!2634 thiss!1305) (buf!2634 (_2!4701 lt!162184)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2246 (buf!2634 thiss!1305)) (currentByte!5164 thiss!1305) (currentBit!5159 thiss!1305))))))

(assert (= (and d!34310 res!89199) b!108224))

(assert (= (and b!108224 res!89198) b!108225))

(assert (= (and b!108225 (not res!89197)) b!108226))

(assert (=> b!108224 m!159793))

(assert (=> b!108224 m!159789))

(assert (=> b!108226 m!159793))

(assert (=> b!108226 m!159793))

(declare-fun m!160275 () Bool)

(assert (=> b!108226 m!160275))

(assert (=> b!107992 d!34310))

(declare-fun d!34312 () Bool)

(declare-fun e!70813 () Bool)

(assert (=> d!34312 e!70813))

(declare-fun res!89202 () Bool)

(assert (=> d!34312 (=> (not res!89202) (not e!70813))))

(declare-fun lt!162825 () (_ BitVec 64))

(declare-fun lt!162824 () BitStream!3966)

(assert (=> d!34312 (= res!89202 (= (bvadd lt!162825 (bvsub lt!162180 lt!162176)) (bitIndex!0 (size!2246 (buf!2634 lt!162824)) (currentByte!5164 lt!162824) (currentBit!5159 lt!162824))))))

(assert (=> d!34312 (or (not (= (bvand lt!162825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162180 lt!162176) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162825 (bvsub lt!162180 lt!162176)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34312 (= lt!162825 (bitIndex!0 (size!2246 (buf!2634 (_2!4703 lt!162191))) (currentByte!5164 (_2!4703 lt!162191)) (currentBit!5159 (_2!4703 lt!162191))))))

(declare-fun moveBitIndex!0 (BitStream!3966 (_ BitVec 64)) tuple2!8888)

(assert (=> d!34312 (= lt!162824 (_2!4701 (moveBitIndex!0 (_2!4703 lt!162191) (bvsub lt!162180 lt!162176))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3966 (_ BitVec 64)) Bool)

(assert (=> d!34312 (moveBitIndexPrecond!0 (_2!4703 lt!162191) (bvsub lt!162180 lt!162176))))

(assert (=> d!34312 (= (withMovedBitIndex!0 (_2!4703 lt!162191) (bvsub lt!162180 lt!162176)) lt!162824)))

(declare-fun b!108229 () Bool)

(assert (=> b!108229 (= e!70813 (= (size!2246 (buf!2634 (_2!4703 lt!162191))) (size!2246 (buf!2634 lt!162824))))))

(assert (= (and d!34312 res!89202) b!108229))

(declare-fun m!160277 () Bool)

(assert (=> d!34312 m!160277))

(declare-fun m!160279 () Bool)

(assert (=> d!34312 m!160279))

(declare-fun m!160281 () Bool)

(assert (=> d!34312 m!160281))

(declare-fun m!160283 () Bool)

(assert (=> d!34312 m!160283))

(assert (=> b!107993 d!34312))

(declare-fun d!34314 () Bool)

(declare-fun e!70814 () Bool)

(assert (=> d!34314 e!70814))

(declare-fun res!89203 () Bool)

(assert (=> d!34314 (=> (not res!89203) (not e!70814))))

(declare-fun lt!162827 () (_ BitVec 64))

(declare-fun lt!162826 () BitStream!3966)

(assert (=> d!34314 (= res!89203 (= (bvadd lt!162827 (bvsub lt!162172 lt!162176)) (bitIndex!0 (size!2246 (buf!2634 lt!162826)) (currentByte!5164 lt!162826) (currentBit!5159 lt!162826))))))

(assert (=> d!34314 (or (not (= (bvand lt!162827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162172 lt!162176) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162827 (bvsub lt!162172 lt!162176)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34314 (= lt!162827 (bitIndex!0 (size!2246 (buf!2634 (_2!4703 lt!162179))) (currentByte!5164 (_2!4703 lt!162179)) (currentBit!5159 (_2!4703 lt!162179))))))

(assert (=> d!34314 (= lt!162826 (_2!4701 (moveBitIndex!0 (_2!4703 lt!162179) (bvsub lt!162172 lt!162176))))))

(assert (=> d!34314 (moveBitIndexPrecond!0 (_2!4703 lt!162179) (bvsub lt!162172 lt!162176))))

(assert (=> d!34314 (= (withMovedBitIndex!0 (_2!4703 lt!162179) (bvsub lt!162172 lt!162176)) lt!162826)))

(declare-fun b!108230 () Bool)

(assert (=> b!108230 (= e!70814 (= (size!2246 (buf!2634 (_2!4703 lt!162179))) (size!2246 (buf!2634 lt!162826))))))

(assert (= (and d!34314 res!89203) b!108230))

(declare-fun m!160285 () Bool)

(assert (=> d!34314 m!160285))

(declare-fun m!160287 () Bool)

(assert (=> d!34314 m!160287))

(declare-fun m!160289 () Bool)

(assert (=> d!34314 m!160289))

(declare-fun m!160291 () Bool)

(assert (=> d!34314 m!160291))

(assert (=> b!107993 d!34314))

(declare-fun lt!162828 () tuple2!8906)

(declare-fun d!34316 () Bool)

(assert (=> d!34316 (= lt!162828 (readNLeastSignificantBitsLoop!0 lt!162171 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162170))))

(assert (=> d!34316 (= (readNLeastSignificantBitsLoopPure!0 lt!162171 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!162170) (tuple2!8895 (_2!4710 lt!162828) (_1!4710 lt!162828)))))

(declare-fun bs!8359 () Bool)

(assert (= bs!8359 d!34316))

(declare-fun m!160293 () Bool)

(assert (=> bs!8359 m!160293))

(assert (=> b!107993 d!34316))

(assert (=> b!107993 d!34306))

(declare-fun d!34318 () Bool)

(declare-fun e!70815 () Bool)

(assert (=> d!34318 e!70815))

(declare-fun res!89205 () Bool)

(assert (=> d!34318 (=> (not res!89205) (not e!70815))))

(declare-fun lt!162830 () (_ BitVec 64))

(declare-fun lt!162829 () (_ BitVec 64))

(declare-fun lt!162832 () (_ BitVec 64))

(assert (=> d!34318 (= res!89205 (= lt!162830 (bvsub lt!162832 lt!162829)))))

(assert (=> d!34318 (or (= (bvand lt!162832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!162829 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!162832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!162832 lt!162829) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34318 (= lt!162829 (remainingBits!0 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))) ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162167))) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162167)))))))

(declare-fun lt!162834 () (_ BitVec 64))

(declare-fun lt!162833 () (_ BitVec 64))

(assert (=> d!34318 (= lt!162832 (bvmul lt!162834 lt!162833))))

(assert (=> d!34318 (or (= lt!162834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!162833 (bvsdiv (bvmul lt!162834 lt!162833) lt!162834)))))

(assert (=> d!34318 (= lt!162833 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34318 (= lt!162834 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))))))

(assert (=> d!34318 (= lt!162830 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5164 (_2!4701 lt!162167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5159 (_2!4701 lt!162167)))))))

(assert (=> d!34318 (invariant!0 (currentBit!5159 (_2!4701 lt!162167)) (currentByte!5164 (_2!4701 lt!162167)) (size!2246 (buf!2634 (_2!4701 lt!162167))))))

(assert (=> d!34318 (= (bitIndex!0 (size!2246 (buf!2634 (_2!4701 lt!162167))) (currentByte!5164 (_2!4701 lt!162167)) (currentBit!5159 (_2!4701 lt!162167))) lt!162830)))

(declare-fun b!108231 () Bool)

(declare-fun res!89204 () Bool)

(assert (=> b!108231 (=> (not res!89204) (not e!70815))))

(assert (=> b!108231 (= res!89204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!162830))))

(declare-fun b!108232 () Bool)

(declare-fun lt!162831 () (_ BitVec 64))

(assert (=> b!108232 (= e!70815 (bvsle lt!162830 (bvmul lt!162831 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!108232 (or (= lt!162831 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!162831 #b0000000000000000000000000000000000000000000000000000000000001000) lt!162831)))))

(assert (=> b!108232 (= lt!162831 ((_ sign_extend 32) (size!2246 (buf!2634 (_2!4701 lt!162167)))))))

(assert (= (and d!34318 res!89205) b!108231))

(assert (= (and b!108231 res!89204) b!108232))

(declare-fun m!160295 () Bool)

(assert (=> d!34318 m!160295))

(assert (=> d!34318 m!159775))

(assert (=> b!107993 d!34318))

(declare-fun d!34320 () Bool)

(declare-fun lt!162848 () tuple2!8894)

(declare-fun lt!162850 () tuple2!8894)

(assert (=> d!34320 (and (= (_2!4704 lt!162848) (_2!4704 lt!162850)) (= (_1!4704 lt!162848) (_1!4704 lt!162850)))))

(declare-fun lt!162851 () BitStream!3966)

(declare-fun lt!162852 () (_ BitVec 64))

(declare-fun lt!162849 () Bool)

(declare-fun lt!162847 () Unit!6610)

(declare-fun choose!45 (BitStream!3966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8894 tuple2!8894 BitStream!3966 (_ BitVec 64) Bool BitStream!3966 (_ BitVec 64) tuple2!8894 tuple2!8894 BitStream!3966 (_ BitVec 64)) Unit!6610)

(assert (=> d!34320 (= lt!162847 (choose!45 (_1!4703 lt!162179) nBits!396 i!615 lt!162186 lt!162848 (tuple2!8895 (_1!4704 lt!162848) (_2!4704 lt!162848)) (_1!4704 lt!162848) (_2!4704 lt!162848) lt!162849 lt!162851 lt!162852 lt!162850 (tuple2!8895 (_1!4704 lt!162850) (_2!4704 lt!162850)) (_1!4704 lt!162850) (_2!4704 lt!162850)))))

(assert (=> d!34320 (= lt!162850 (readNLeastSignificantBitsLoopPure!0 lt!162851 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!162852))))

(assert (=> d!34320 (= lt!162852 (bvor lt!162186 (ite lt!162849 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34320 (= lt!162851 (withMovedBitIndex!0 (_1!4703 lt!162179) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34320 (= lt!162849 (_2!4702 (readBitPure!0 (_1!4703 lt!162179))))))

(assert (=> d!34320 (= lt!162848 (readNLeastSignificantBitsLoopPure!0 (_1!4703 lt!162179) nBits!396 i!615 lt!162186))))

(assert (=> d!34320 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4703 lt!162179) nBits!396 i!615 lt!162186) lt!162847)))

(declare-fun bs!8361 () Bool)

(assert (= bs!8361 d!34320))

(assert (=> bs!8361 m!159791))

(assert (=> bs!8361 m!159825))

(declare-fun m!160297 () Bool)

(assert (=> bs!8361 m!160297))

(assert (=> bs!8361 m!159839))

(declare-fun m!160299 () Bool)

(assert (=> bs!8361 m!160299))

(assert (=> b!107993 d!34320))

(declare-fun d!34322 () Bool)

(declare-fun e!70816 () Bool)

(assert (=> d!34322 e!70816))

(declare-fun res!89206 () Bool)

(assert (=> d!34322 (=> (not res!89206) (not e!70816))))

(declare-fun lt!162854 () (_ BitVec 64))

(declare-fun lt!162853 () BitStream!3966)

(assert (=> d!34322 (= res!89206 (= (bvadd lt!162854 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2246 (buf!2634 lt!162853)) (currentByte!5164 lt!162853) (currentBit!5159 lt!162853))))))

(assert (=> d!34322 (or (not (= (bvand lt!162854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!162854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!162854 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34322 (= lt!162854 (bitIndex!0 (size!2246 (buf!2634 (_1!4703 lt!162179))) (currentByte!5164 (_1!4703 lt!162179)) (currentBit!5159 (_1!4703 lt!162179))))))

(assert (=> d!34322 (= lt!162853 (_2!4701 (moveBitIndex!0 (_1!4703 lt!162179) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!34322 (moveBitIndexPrecond!0 (_1!4703 lt!162179) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34322 (= (withMovedBitIndex!0 (_1!4703 lt!162179) #b0000000000000000000000000000000000000000000000000000000000000001) lt!162853)))

(declare-fun b!108233 () Bool)

(assert (=> b!108233 (= e!70816 (= (size!2246 (buf!2634 (_1!4703 lt!162179))) (size!2246 (buf!2634 lt!162853))))))

(assert (= (and d!34322 res!89206) b!108233))

(declare-fun m!160301 () Bool)

(assert (=> d!34322 m!160301))

(declare-fun m!160303 () Bool)

(assert (=> d!34322 m!160303))

(declare-fun m!160305 () Bool)

(assert (=> d!34322 m!160305))

(declare-fun m!160307 () Bool)

(assert (=> d!34322 m!160307))

(assert (=> b!107993 d!34322))

(assert (=> b!107993 d!34308))

(check-sat (not b!108050) (not d!34284) (not b!108179) (not d!34316) (not d!34286) (not d!34274) (not b!108065) (not b!108186) (not d!34320) (not b!108205) (not d!34292) (not d!34308) (not d!34188) (not b!108183) (not b!108052) (not b!108219) (not d!34322) (not d!34314) (not b!108062) (not d!34306) (not d!34294) (not b!108211) (not d!34272) (not d!34296) (not b!108063) (not d!34182) (not b!108185) (not d!34270) (not d!34268) (not d!34312) (not d!34302) (not d!34318) (not b!108180) (not b!108210) (not d!34282) (not b!108064) (not d!34178) (not d!34290) (not b!108224) (not b!108182) (not d!34180) (not d!34280) (not b!108177) (not b!108209) (not d!34276) (not b!108181) (not d!34186) (not b!108204) (not b!108207) (not b!108188) (not b!108187) (not b!108212) (not b!108226) (not d!34278) (not d!34184) (not b!108206) (not bm!1368))

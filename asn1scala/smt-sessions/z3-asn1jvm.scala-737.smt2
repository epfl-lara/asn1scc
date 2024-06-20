; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20592 () Bool)

(assert start!20592)

(declare-fun b!103897 () Bool)

(declare-fun e!68026 () Bool)

(assert (=> b!103897 (= e!68026 true)))

(declare-datatypes ((array!4850 0))(
  ( (array!4851 (arr!2806 (Array (_ BitVec 32) (_ BitVec 8))) (size!2213 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3900 0))(
  ( (BitStream!3901 (buf!2579 array!4850) (currentByte!5064 (_ BitVec 32)) (currentBit!5059 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8550 0))(
  ( (tuple2!8551 (_1!4530 BitStream!3900) (_2!4530 (_ BitVec 64))) )
))
(declare-fun lt!152150 () tuple2!8550)

(declare-datatypes ((tuple2!8552 0))(
  ( (tuple2!8553 (_1!4531 BitStream!3900) (_2!4531 BitStream!3900)) )
))
(declare-fun lt!152156 () tuple2!8552)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!152162 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8550)

(declare-fun withMovedBitIndex!0 (BitStream!3900 (_ BitVec 64)) BitStream!3900)

(assert (=> b!103897 (= lt!152150 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4531 lt!152156) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152162))))

(declare-fun b!103898 () Bool)

(declare-fun e!68027 () Bool)

(declare-fun e!68033 () Bool)

(assert (=> b!103898 (= e!68027 e!68033)))

(declare-fun res!85511 () Bool)

(assert (=> b!103898 (=> (not res!85511) (not e!68033))))

(declare-fun lt!152161 () Bool)

(declare-datatypes ((Unit!6370 0))(
  ( (Unit!6371) )
))
(declare-datatypes ((tuple2!8554 0))(
  ( (tuple2!8555 (_1!4532 Unit!6370) (_2!4532 BitStream!3900)) )
))
(declare-fun lt!152154 () tuple2!8554)

(declare-datatypes ((tuple2!8556 0))(
  ( (tuple2!8557 (_1!4533 BitStream!3900) (_2!4533 Bool)) )
))
(declare-fun lt!152142 () tuple2!8556)

(assert (=> b!103898 (= res!85511 (and (= (_2!4533 lt!152142) lt!152161) (= (_1!4533 lt!152142) (_2!4532 lt!152154))))))

(declare-fun thiss!1305 () BitStream!3900)

(declare-fun readBitPure!0 (BitStream!3900) tuple2!8556)

(declare-fun readerFrom!0 (BitStream!3900 (_ BitVec 32) (_ BitVec 32)) BitStream!3900)

(assert (=> b!103898 (= lt!152142 (readBitPure!0 (readerFrom!0 (_2!4532 lt!152154) (currentBit!5059 thiss!1305) (currentByte!5064 thiss!1305))))))

(declare-fun b!103899 () Bool)

(declare-fun e!68031 () Bool)

(declare-fun e!68030 () Bool)

(assert (=> b!103899 (= e!68031 e!68030)))

(declare-fun res!85512 () Bool)

(assert (=> b!103899 (=> (not res!85512) (not e!68030))))

(declare-fun lt!152146 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103899 (= res!85512 (validate_offset_bits!1 ((_ sign_extend 32) (size!2213 (buf!2579 thiss!1305))) ((_ sign_extend 32) (currentByte!5064 thiss!1305)) ((_ sign_extend 32) (currentBit!5059 thiss!1305)) lt!152146))))

(assert (=> b!103899 (= lt!152146 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103900 () Bool)

(declare-fun res!85513 () Bool)

(assert (=> b!103900 (=> (not res!85513) (not e!68027))))

(declare-fun isPrefixOf!0 (BitStream!3900 BitStream!3900) Bool)

(assert (=> b!103900 (= res!85513 (isPrefixOf!0 thiss!1305 (_2!4532 lt!152154)))))

(declare-fun b!103901 () Bool)

(declare-fun res!85516 () Bool)

(assert (=> b!103901 (=> res!85516 e!68026)))

(assert (=> b!103901 (= res!85516 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2213 (buf!2579 (_1!4531 lt!152156)))) ((_ sign_extend 32) (currentByte!5064 (_1!4531 lt!152156))) ((_ sign_extend 32) (currentBit!5059 (_1!4531 lt!152156))) lt!152146)))))

(declare-fun b!103902 () Bool)

(declare-fun e!68034 () Bool)

(assert (=> b!103902 (= e!68034 (not e!68026))))

(declare-fun res!85520 () Bool)

(assert (=> b!103902 (=> res!85520 e!68026)))

(declare-fun lt!152140 () tuple2!8552)

(assert (=> b!103902 (= res!85520 (not (= (_1!4530 (readNLeastSignificantBitsLoopPure!0 (_1!4531 lt!152140) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152162)) (_2!4531 lt!152140))))))

(declare-fun lt!152147 () tuple2!8554)

(declare-fun lt!152164 () (_ BitVec 64))

(assert (=> b!103902 (validate_offset_bits!1 ((_ sign_extend 32) (size!2213 (buf!2579 (_2!4532 lt!152147)))) ((_ sign_extend 32) (currentByte!5064 (_2!4532 lt!152154))) ((_ sign_extend 32) (currentBit!5059 (_2!4532 lt!152154))) lt!152164)))

(declare-fun lt!152152 () Unit!6370)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3900 array!4850 (_ BitVec 64)) Unit!6370)

(assert (=> b!103902 (= lt!152152 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4532 lt!152154) (buf!2579 (_2!4532 lt!152147)) lt!152164))))

(assert (=> b!103902 (= lt!152164 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152143 () (_ BitVec 64))

(declare-fun lt!152149 () tuple2!8556)

(declare-fun lt!152163 () (_ BitVec 64))

(assert (=> b!103902 (= lt!152162 (bvor lt!152143 (ite (_2!4533 lt!152149) lt!152163 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152157 () tuple2!8550)

(assert (=> b!103902 (= lt!152157 (readNLeastSignificantBitsLoopPure!0 (_1!4531 lt!152156) nBits!396 i!615 lt!152143))))

(assert (=> b!103902 (validate_offset_bits!1 ((_ sign_extend 32) (size!2213 (buf!2579 (_2!4532 lt!152147)))) ((_ sign_extend 32) (currentByte!5064 thiss!1305)) ((_ sign_extend 32) (currentBit!5059 thiss!1305)) lt!152146)))

(declare-fun lt!152160 () Unit!6370)

(assert (=> b!103902 (= lt!152160 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2579 (_2!4532 lt!152147)) lt!152146))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!152145 () (_ BitVec 64))

(assert (=> b!103902 (= lt!152143 (bvand v!199 (bvnot lt!152145)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103902 (= lt!152145 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(assert (=> b!103902 (= (_2!4533 lt!152149) lt!152161)))

(assert (=> b!103902 (= lt!152149 (readBitPure!0 (_1!4531 lt!152156)))))

(declare-fun reader!0 (BitStream!3900 BitStream!3900) tuple2!8552)

(assert (=> b!103902 (= lt!152140 (reader!0 (_2!4532 lt!152154) (_2!4532 lt!152147)))))

(assert (=> b!103902 (= lt!152156 (reader!0 thiss!1305 (_2!4532 lt!152147)))))

(declare-fun e!68029 () Bool)

(assert (=> b!103902 e!68029))

(declare-fun res!85514 () Bool)

(assert (=> b!103902 (=> (not res!85514) (not e!68029))))

(declare-fun lt!152159 () tuple2!8556)

(declare-fun lt!152141 () tuple2!8556)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103902 (= res!85514 (= (bitIndex!0 (size!2213 (buf!2579 (_1!4533 lt!152159))) (currentByte!5064 (_1!4533 lt!152159)) (currentBit!5059 (_1!4533 lt!152159))) (bitIndex!0 (size!2213 (buf!2579 (_1!4533 lt!152141))) (currentByte!5064 (_1!4533 lt!152141)) (currentBit!5059 (_1!4533 lt!152141)))))))

(declare-fun lt!152148 () Unit!6370)

(declare-fun lt!152153 () BitStream!3900)

(declare-fun readBitPrefixLemma!0 (BitStream!3900 BitStream!3900) Unit!6370)

(assert (=> b!103902 (= lt!152148 (readBitPrefixLemma!0 lt!152153 (_2!4532 lt!152147)))))

(assert (=> b!103902 (= lt!152141 (readBitPure!0 (BitStream!3901 (buf!2579 (_2!4532 lt!152147)) (currentByte!5064 thiss!1305) (currentBit!5059 thiss!1305))))))

(assert (=> b!103902 (= lt!152159 (readBitPure!0 lt!152153))))

(assert (=> b!103902 (= lt!152153 (BitStream!3901 (buf!2579 (_2!4532 lt!152154)) (currentByte!5064 thiss!1305) (currentBit!5059 thiss!1305)))))

(declare-fun e!68028 () Bool)

(assert (=> b!103902 e!68028))

(declare-fun res!85508 () Bool)

(assert (=> b!103902 (=> (not res!85508) (not e!68028))))

(assert (=> b!103902 (= res!85508 (isPrefixOf!0 thiss!1305 (_2!4532 lt!152147)))))

(declare-fun lt!152144 () Unit!6370)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3900 BitStream!3900 BitStream!3900) Unit!6370)

(assert (=> b!103902 (= lt!152144 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4532 lt!152154) (_2!4532 lt!152147)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3900 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8554)

(assert (=> b!103902 (= lt!152147 (appendNLeastSignificantBitsLoop!0 (_2!4532 lt!152154) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!68024 () Bool)

(assert (=> b!103902 e!68024))

(declare-fun res!85517 () Bool)

(assert (=> b!103902 (=> (not res!85517) (not e!68024))))

(assert (=> b!103902 (= res!85517 (= (size!2213 (buf!2579 thiss!1305)) (size!2213 (buf!2579 (_2!4532 lt!152154)))))))

(declare-fun appendBit!0 (BitStream!3900 Bool) tuple2!8554)

(assert (=> b!103902 (= lt!152154 (appendBit!0 thiss!1305 lt!152161))))

(assert (=> b!103902 (= lt!152161 (not (= (bvand v!199 lt!152163) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103902 (= lt!152163 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103903 () Bool)

(declare-fun res!85519 () Bool)

(assert (=> b!103903 (=> res!85519 e!68026)))

(declare-fun lt!152151 () (_ BitVec 64))

(assert (=> b!103903 (= res!85519 (or (not (= (bvand lt!152143 lt!152145) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152143 lt!152151) lt!152143))))))

(declare-fun b!103905 () Bool)

(assert (=> b!103905 (= e!68029 (= (_2!4533 lt!152159) (_2!4533 lt!152141)))))

(declare-fun b!103906 () Bool)

(declare-fun lt!152158 () (_ BitVec 64))

(assert (=> b!103906 (= e!68033 (= (bitIndex!0 (size!2213 (buf!2579 (_1!4533 lt!152142))) (currentByte!5064 (_1!4533 lt!152142)) (currentBit!5059 (_1!4533 lt!152142))) lt!152158))))

(declare-fun b!103907 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103907 (= e!68028 (invariant!0 (currentBit!5059 thiss!1305) (currentByte!5064 thiss!1305) (size!2213 (buf!2579 (_2!4532 lt!152147)))))))

(declare-fun b!103908 () Bool)

(assert (=> b!103908 (= e!68024 e!68027)))

(declare-fun res!85510 () Bool)

(assert (=> b!103908 (=> (not res!85510) (not e!68027))))

(declare-fun lt!152155 () (_ BitVec 64))

(assert (=> b!103908 (= res!85510 (= lt!152158 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152155)))))

(assert (=> b!103908 (= lt!152158 (bitIndex!0 (size!2213 (buf!2579 (_2!4532 lt!152154))) (currentByte!5064 (_2!4532 lt!152154)) (currentBit!5059 (_2!4532 lt!152154))))))

(assert (=> b!103908 (= lt!152155 (bitIndex!0 (size!2213 (buf!2579 thiss!1305)) (currentByte!5064 thiss!1305) (currentBit!5059 thiss!1305)))))

(declare-fun b!103909 () Bool)

(declare-fun e!68025 () Bool)

(declare-fun array_inv!2015 (array!4850) Bool)

(assert (=> b!103909 (= e!68025 (array_inv!2015 (buf!2579 thiss!1305)))))

(declare-fun b!103910 () Bool)

(declare-fun res!85509 () Bool)

(assert (=> b!103910 (=> (not res!85509) (not e!68028))))

(assert (=> b!103910 (= res!85509 (invariant!0 (currentBit!5059 thiss!1305) (currentByte!5064 thiss!1305) (size!2213 (buf!2579 (_2!4532 lt!152154)))))))

(declare-fun b!103904 () Bool)

(assert (=> b!103904 (= e!68030 e!68034)))

(declare-fun res!85515 () Bool)

(assert (=> b!103904 (=> (not res!85515) (not e!68034))))

(assert (=> b!103904 (= res!85515 (and (= (bvand v!199 lt!152151) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103904 (= lt!152151 (onesLSBLong!0 nBits!396))))

(declare-fun res!85518 () Bool)

(assert (=> start!20592 (=> (not res!85518) (not e!68031))))

(assert (=> start!20592 (= res!85518 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20592 e!68031))

(assert (=> start!20592 true))

(declare-fun inv!12 (BitStream!3900) Bool)

(assert (=> start!20592 (and (inv!12 thiss!1305) e!68025)))

(assert (= (and start!20592 res!85518) b!103899))

(assert (= (and b!103899 res!85512) b!103904))

(assert (= (and b!103904 res!85515) b!103902))

(assert (= (and b!103902 res!85517) b!103908))

(assert (= (and b!103908 res!85510) b!103900))

(assert (= (and b!103900 res!85513) b!103898))

(assert (= (and b!103898 res!85511) b!103906))

(assert (= (and b!103902 res!85508) b!103910))

(assert (= (and b!103910 res!85509) b!103907))

(assert (= (and b!103902 res!85514) b!103905))

(assert (= (and b!103902 (not res!85520)) b!103901))

(assert (= (and b!103901 (not res!85516)) b!103903))

(assert (= (and b!103903 (not res!85519)) b!103897))

(assert (= start!20592 b!103909))

(declare-fun m!151773 () Bool)

(assert (=> start!20592 m!151773))

(declare-fun m!151775 () Bool)

(assert (=> b!103908 m!151775))

(declare-fun m!151777 () Bool)

(assert (=> b!103908 m!151777))

(declare-fun m!151779 () Bool)

(assert (=> b!103909 m!151779))

(declare-fun m!151781 () Bool)

(assert (=> b!103910 m!151781))

(declare-fun m!151783 () Bool)

(assert (=> b!103901 m!151783))

(declare-fun m!151785 () Bool)

(assert (=> b!103898 m!151785))

(assert (=> b!103898 m!151785))

(declare-fun m!151787 () Bool)

(assert (=> b!103898 m!151787))

(declare-fun m!151789 () Bool)

(assert (=> b!103904 m!151789))

(declare-fun m!151791 () Bool)

(assert (=> b!103902 m!151791))

(declare-fun m!151793 () Bool)

(assert (=> b!103902 m!151793))

(declare-fun m!151795 () Bool)

(assert (=> b!103902 m!151795))

(declare-fun m!151797 () Bool)

(assert (=> b!103902 m!151797))

(declare-fun m!151799 () Bool)

(assert (=> b!103902 m!151799))

(declare-fun m!151801 () Bool)

(assert (=> b!103902 m!151801))

(declare-fun m!151803 () Bool)

(assert (=> b!103902 m!151803))

(declare-fun m!151805 () Bool)

(assert (=> b!103902 m!151805))

(declare-fun m!151807 () Bool)

(assert (=> b!103902 m!151807))

(declare-fun m!151809 () Bool)

(assert (=> b!103902 m!151809))

(declare-fun m!151811 () Bool)

(assert (=> b!103902 m!151811))

(declare-fun m!151813 () Bool)

(assert (=> b!103902 m!151813))

(declare-fun m!151815 () Bool)

(assert (=> b!103902 m!151815))

(declare-fun m!151817 () Bool)

(assert (=> b!103902 m!151817))

(declare-fun m!151819 () Bool)

(assert (=> b!103902 m!151819))

(declare-fun m!151821 () Bool)

(assert (=> b!103902 m!151821))

(declare-fun m!151823 () Bool)

(assert (=> b!103902 m!151823))

(declare-fun m!151825 () Bool)

(assert (=> b!103902 m!151825))

(declare-fun m!151827 () Bool)

(assert (=> b!103902 m!151827))

(declare-fun m!151829 () Bool)

(assert (=> b!103897 m!151829))

(assert (=> b!103897 m!151829))

(declare-fun m!151831 () Bool)

(assert (=> b!103897 m!151831))

(declare-fun m!151833 () Bool)

(assert (=> b!103899 m!151833))

(declare-fun m!151835 () Bool)

(assert (=> b!103906 m!151835))

(declare-fun m!151837 () Bool)

(assert (=> b!103900 m!151837))

(declare-fun m!151839 () Bool)

(assert (=> b!103907 m!151839))

(check-sat (not b!103909) (not start!20592) (not b!103906) (not b!103904) (not b!103907) (not b!103899) (not b!103900) (not b!103908) (not b!103897) (not b!103902) (not b!103898) (not b!103910) (not b!103901))

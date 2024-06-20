; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21610 () Bool)

(assert start!21610)

(declare-fun b!109045 () Bool)

(declare-fun e!71430 () Bool)

(assert (=> b!109045 (= e!71430 true)))

(declare-fun e!71425 () Bool)

(assert (=> b!109045 e!71425))

(declare-fun res!89952 () Bool)

(assert (=> b!109045 (=> (not res!89952) (not e!71425))))

(declare-datatypes ((array!4973 0))(
  ( (array!4974 (arr!2856 (Array (_ BitVec 32) (_ BitVec 8))) (size!2263 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4000 0))(
  ( (BitStream!4001 (buf!2654 array!4973) (currentByte!5190 (_ BitVec 32)) (currentBit!5185 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9036 0))(
  ( (tuple2!9037 (_1!4775 BitStream!4000) (_2!4775 BitStream!4000)) )
))
(declare-fun lt!164646 () tuple2!9036)

(declare-fun lt!164651 () (_ BitVec 64))

(declare-fun lt!164672 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4000 (_ BitVec 64)) BitStream!4000)

(assert (=> b!109045 (= res!89952 (= (_1!4775 lt!164646) (withMovedBitIndex!0 (_2!4775 lt!164646) (bvsub lt!164672 lt!164651))))))

(declare-datatypes ((Unit!6667 0))(
  ( (Unit!6668) )
))
(declare-datatypes ((tuple2!9038 0))(
  ( (tuple2!9039 (_1!4776 Unit!6667) (_2!4776 BitStream!4000)) )
))
(declare-fun lt!164661 () tuple2!9038)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109045 (= lt!164672 (bitIndex!0 (size!2263 (buf!2654 (_2!4776 lt!164661))) (currentByte!5190 (_2!4776 lt!164661)) (currentBit!5185 (_2!4776 lt!164661))))))

(declare-fun lt!164671 () tuple2!9036)

(declare-fun lt!164648 () (_ BitVec 64))

(assert (=> b!109045 (= (_1!4775 lt!164671) (withMovedBitIndex!0 (_2!4775 lt!164671) (bvsub lt!164648 lt!164651)))))

(declare-fun lt!164652 () tuple2!9038)

(assert (=> b!109045 (= lt!164651 (bitIndex!0 (size!2263 (buf!2654 (_2!4776 lt!164652))) (currentByte!5190 (_2!4776 lt!164652)) (currentBit!5185 (_2!4776 lt!164652))))))

(declare-fun thiss!1305 () BitStream!4000)

(assert (=> b!109045 (= lt!164648 (bitIndex!0 (size!2263 (buf!2654 thiss!1305)) (currentByte!5190 thiss!1305) (currentBit!5185 thiss!1305)))))

(declare-datatypes ((tuple2!9040 0))(
  ( (tuple2!9041 (_1!4777 BitStream!4000) (_2!4777 (_ BitVec 64))) )
))
(declare-fun lt!164662 () tuple2!9040)

(declare-fun lt!164649 () tuple2!9040)

(assert (=> b!109045 (and (= (_2!4777 lt!164662) (_2!4777 lt!164649)) (= (_1!4777 lt!164662) (_1!4777 lt!164649)))))

(declare-fun lt!164660 () Unit!6667)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!164656 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6667)

(assert (=> b!109045 (= lt!164660 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4775 lt!164671) nBits!396 i!615 lt!164656))))

(declare-fun lt!164647 () BitStream!4000)

(declare-fun lt!164654 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9040)

(assert (=> b!109045 (= lt!164649 (readNLeastSignificantBitsLoopPure!0 lt!164647 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164654))))

(assert (=> b!109045 (= lt!164647 (withMovedBitIndex!0 (_1!4775 lt!164671) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109046 () Bool)

(declare-fun res!89949 () Bool)

(declare-fun e!71429 () Bool)

(assert (=> b!109046 (=> (not res!89949) (not e!71429))))

(declare-fun isPrefixOf!0 (BitStream!4000 BitStream!4000) Bool)

(assert (=> b!109046 (= res!89949 (isPrefixOf!0 thiss!1305 (_2!4776 lt!164661)))))

(declare-fun b!109047 () Bool)

(declare-fun e!71422 () Bool)

(declare-fun array_inv!2065 (array!4973) Bool)

(assert (=> b!109047 (= e!71422 (array_inv!2065 (buf!2654 thiss!1305)))))

(declare-fun b!109048 () Bool)

(declare-fun res!89941 () Bool)

(declare-fun e!71428 () Bool)

(assert (=> b!109048 (=> (not res!89941) (not e!71428))))

(assert (=> b!109048 (= res!89941 (bvslt i!615 nBits!396))))

(declare-fun b!109049 () Bool)

(declare-fun res!89947 () Bool)

(assert (=> b!109049 (=> (not res!89947) (not e!71428))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109049 (= res!89947 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109050 () Bool)

(declare-fun e!71423 () Bool)

(assert (=> b!109050 (= e!71429 e!71423)))

(declare-fun res!89946 () Bool)

(assert (=> b!109050 (=> (not res!89946) (not e!71423))))

(declare-fun lt!164650 () Bool)

(declare-datatypes ((tuple2!9042 0))(
  ( (tuple2!9043 (_1!4778 BitStream!4000) (_2!4778 Bool)) )
))
(declare-fun lt!164659 () tuple2!9042)

(assert (=> b!109050 (= res!89946 (and (= (_2!4778 lt!164659) lt!164650) (= (_1!4778 lt!164659) (_2!4776 lt!164661))))))

(declare-fun readBitPure!0 (BitStream!4000) tuple2!9042)

(declare-fun readerFrom!0 (BitStream!4000 (_ BitVec 32) (_ BitVec 32)) BitStream!4000)

(assert (=> b!109050 (= lt!164659 (readBitPure!0 (readerFrom!0 (_2!4776 lt!164661) (currentBit!5185 thiss!1305) (currentByte!5190 thiss!1305))))))

(declare-fun b!109051 () Bool)

(declare-fun lt!164668 () tuple2!9040)

(assert (=> b!109051 (= e!71425 (and (= lt!164648 (bvsub lt!164672 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4775 lt!164646) lt!164647)) (and (= (_2!4777 lt!164662) (_2!4777 lt!164668)) (= (_1!4777 lt!164662) (_2!4775 lt!164671))))))))

(declare-fun res!89948 () Bool)

(declare-fun e!71426 () Bool)

(assert (=> start!21610 (=> (not res!89948) (not e!71426))))

(assert (=> start!21610 (= res!89948 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21610 e!71426))

(assert (=> start!21610 true))

(declare-fun inv!12 (BitStream!4000) Bool)

(assert (=> start!21610 (and (inv!12 thiss!1305) e!71422)))

(declare-fun b!109044 () Bool)

(declare-fun lt!164664 () (_ BitVec 64))

(assert (=> b!109044 (= e!71423 (= (bitIndex!0 (size!2263 (buf!2654 (_1!4778 lt!164659))) (currentByte!5190 (_1!4778 lt!164659)) (currentBit!5185 (_1!4778 lt!164659))) lt!164664))))

(declare-fun b!109052 () Bool)

(declare-fun e!71432 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109052 (= e!71432 (invariant!0 (currentBit!5185 thiss!1305) (currentByte!5190 thiss!1305) (size!2263 (buf!2654 (_2!4776 lt!164652)))))))

(declare-fun b!109053 () Bool)

(declare-fun e!71431 () Bool)

(declare-fun lt!164655 () tuple2!9042)

(declare-fun lt!164665 () tuple2!9042)

(assert (=> b!109053 (= e!71431 (= (_2!4778 lt!164655) (_2!4778 lt!164665)))))

(declare-fun b!109054 () Bool)

(assert (=> b!109054 (= e!71428 (not e!71430))))

(declare-fun res!89951 () Bool)

(assert (=> b!109054 (=> res!89951 e!71430)))

(assert (=> b!109054 (= res!89951 (not (= (_1!4777 lt!164668) (_2!4775 lt!164646))))))

(assert (=> b!109054 (= lt!164668 (readNLeastSignificantBitsLoopPure!0 (_1!4775 lt!164646) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164654))))

(declare-fun lt!164658 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109054 (validate_offset_bits!1 ((_ sign_extend 32) (size!2263 (buf!2654 (_2!4776 lt!164652)))) ((_ sign_extend 32) (currentByte!5190 (_2!4776 lt!164661))) ((_ sign_extend 32) (currentBit!5185 (_2!4776 lt!164661))) lt!164658)))

(declare-fun lt!164663 () Unit!6667)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4000 array!4973 (_ BitVec 64)) Unit!6667)

(assert (=> b!109054 (= lt!164663 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4776 lt!164661) (buf!2654 (_2!4776 lt!164652)) lt!164658))))

(assert (=> b!109054 (= lt!164658 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164645 () tuple2!9042)

(declare-fun lt!164644 () (_ BitVec 64))

(assert (=> b!109054 (= lt!164654 (bvor lt!164656 (ite (_2!4778 lt!164645) lt!164644 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109054 (= lt!164662 (readNLeastSignificantBitsLoopPure!0 (_1!4775 lt!164671) nBits!396 i!615 lt!164656))))

(declare-fun lt!164667 () (_ BitVec 64))

(assert (=> b!109054 (validate_offset_bits!1 ((_ sign_extend 32) (size!2263 (buf!2654 (_2!4776 lt!164652)))) ((_ sign_extend 32) (currentByte!5190 thiss!1305)) ((_ sign_extend 32) (currentBit!5185 thiss!1305)) lt!164667)))

(declare-fun lt!164666 () Unit!6667)

(assert (=> b!109054 (= lt!164666 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2654 (_2!4776 lt!164652)) lt!164667))))

(assert (=> b!109054 (= lt!164656 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!109054 (= (_2!4778 lt!164645) lt!164650)))

(assert (=> b!109054 (= lt!164645 (readBitPure!0 (_1!4775 lt!164671)))))

(declare-fun reader!0 (BitStream!4000 BitStream!4000) tuple2!9036)

(assert (=> b!109054 (= lt!164646 (reader!0 (_2!4776 lt!164661) (_2!4776 lt!164652)))))

(assert (=> b!109054 (= lt!164671 (reader!0 thiss!1305 (_2!4776 lt!164652)))))

(assert (=> b!109054 e!71431))

(declare-fun res!89945 () Bool)

(assert (=> b!109054 (=> (not res!89945) (not e!71431))))

(assert (=> b!109054 (= res!89945 (= (bitIndex!0 (size!2263 (buf!2654 (_1!4778 lt!164655))) (currentByte!5190 (_1!4778 lt!164655)) (currentBit!5185 (_1!4778 lt!164655))) (bitIndex!0 (size!2263 (buf!2654 (_1!4778 lt!164665))) (currentByte!5190 (_1!4778 lt!164665)) (currentBit!5185 (_1!4778 lt!164665)))))))

(declare-fun lt!164657 () Unit!6667)

(declare-fun lt!164653 () BitStream!4000)

(declare-fun readBitPrefixLemma!0 (BitStream!4000 BitStream!4000) Unit!6667)

(assert (=> b!109054 (= lt!164657 (readBitPrefixLemma!0 lt!164653 (_2!4776 lt!164652)))))

(assert (=> b!109054 (= lt!164665 (readBitPure!0 (BitStream!4001 (buf!2654 (_2!4776 lt!164652)) (currentByte!5190 thiss!1305) (currentBit!5185 thiss!1305))))))

(assert (=> b!109054 (= lt!164655 (readBitPure!0 lt!164653))))

(assert (=> b!109054 (= lt!164653 (BitStream!4001 (buf!2654 (_2!4776 lt!164661)) (currentByte!5190 thiss!1305) (currentBit!5185 thiss!1305)))))

(assert (=> b!109054 e!71432))

(declare-fun res!89943 () Bool)

(assert (=> b!109054 (=> (not res!89943) (not e!71432))))

(assert (=> b!109054 (= res!89943 (isPrefixOf!0 thiss!1305 (_2!4776 lt!164652)))))

(declare-fun lt!164670 () Unit!6667)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4000 BitStream!4000 BitStream!4000) Unit!6667)

(assert (=> b!109054 (= lt!164670 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4776 lt!164661) (_2!4776 lt!164652)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4000 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9038)

(assert (=> b!109054 (= lt!164652 (appendNLeastSignificantBitsLoop!0 (_2!4776 lt!164661) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!71427 () Bool)

(assert (=> b!109054 e!71427))

(declare-fun res!89953 () Bool)

(assert (=> b!109054 (=> (not res!89953) (not e!71427))))

(assert (=> b!109054 (= res!89953 (= (size!2263 (buf!2654 thiss!1305)) (size!2263 (buf!2654 (_2!4776 lt!164661)))))))

(declare-fun appendBit!0 (BitStream!4000 Bool) tuple2!9038)

(assert (=> b!109054 (= lt!164661 (appendBit!0 thiss!1305 lt!164650))))

(assert (=> b!109054 (= lt!164650 (not (= (bvand v!199 lt!164644) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109054 (= lt!164644 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109055 () Bool)

(assert (=> b!109055 (= e!71426 e!71428)))

(declare-fun res!89942 () Bool)

(assert (=> b!109055 (=> (not res!89942) (not e!71428))))

(assert (=> b!109055 (= res!89942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2263 (buf!2654 thiss!1305))) ((_ sign_extend 32) (currentByte!5190 thiss!1305)) ((_ sign_extend 32) (currentBit!5185 thiss!1305)) lt!164667))))

(assert (=> b!109055 (= lt!164667 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109056 () Bool)

(assert (=> b!109056 (= e!71427 e!71429)))

(declare-fun res!89950 () Bool)

(assert (=> b!109056 (=> (not res!89950) (not e!71429))))

(declare-fun lt!164669 () (_ BitVec 64))

(assert (=> b!109056 (= res!89950 (= lt!164664 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164669)))))

(assert (=> b!109056 (= lt!164664 (bitIndex!0 (size!2263 (buf!2654 (_2!4776 lt!164661))) (currentByte!5190 (_2!4776 lt!164661)) (currentBit!5185 (_2!4776 lt!164661))))))

(assert (=> b!109056 (= lt!164669 (bitIndex!0 (size!2263 (buf!2654 thiss!1305)) (currentByte!5190 thiss!1305) (currentBit!5185 thiss!1305)))))

(declare-fun b!109057 () Bool)

(declare-fun res!89944 () Bool)

(assert (=> b!109057 (=> (not res!89944) (not e!71432))))

(assert (=> b!109057 (= res!89944 (invariant!0 (currentBit!5185 thiss!1305) (currentByte!5190 thiss!1305) (size!2263 (buf!2654 (_2!4776 lt!164661)))))))

(assert (= (and start!21610 res!89948) b!109055))

(assert (= (and b!109055 res!89942) b!109049))

(assert (= (and b!109049 res!89947) b!109048))

(assert (= (and b!109048 res!89941) b!109054))

(assert (= (and b!109054 res!89953) b!109056))

(assert (= (and b!109056 res!89950) b!109046))

(assert (= (and b!109046 res!89949) b!109050))

(assert (= (and b!109050 res!89946) b!109044))

(assert (= (and b!109054 res!89943) b!109057))

(assert (= (and b!109057 res!89944) b!109052))

(assert (= (and b!109054 res!89945) b!109053))

(assert (= (and b!109054 (not res!89951)) b!109045))

(assert (= (and b!109045 res!89952) b!109051))

(assert (= start!21610 b!109047))

(declare-fun m!161765 () Bool)

(assert (=> b!109056 m!161765))

(declare-fun m!161767 () Bool)

(assert (=> b!109056 m!161767))

(declare-fun m!161769 () Bool)

(assert (=> b!109055 m!161769))

(declare-fun m!161771 () Bool)

(assert (=> start!21610 m!161771))

(declare-fun m!161773 () Bool)

(assert (=> b!109046 m!161773))

(declare-fun m!161775 () Bool)

(assert (=> b!109057 m!161775))

(declare-fun m!161777 () Bool)

(assert (=> b!109044 m!161777))

(declare-fun m!161779 () Bool)

(assert (=> b!109052 m!161779))

(declare-fun m!161781 () Bool)

(assert (=> b!109045 m!161781))

(declare-fun m!161783 () Bool)

(assert (=> b!109045 m!161783))

(declare-fun m!161785 () Bool)

(assert (=> b!109045 m!161785))

(assert (=> b!109045 m!161767))

(assert (=> b!109045 m!161765))

(declare-fun m!161787 () Bool)

(assert (=> b!109045 m!161787))

(declare-fun m!161789 () Bool)

(assert (=> b!109045 m!161789))

(declare-fun m!161791 () Bool)

(assert (=> b!109045 m!161791))

(declare-fun m!161793 () Bool)

(assert (=> b!109047 m!161793))

(declare-fun m!161795 () Bool)

(assert (=> b!109050 m!161795))

(assert (=> b!109050 m!161795))

(declare-fun m!161797 () Bool)

(assert (=> b!109050 m!161797))

(declare-fun m!161799 () Bool)

(assert (=> b!109049 m!161799))

(declare-fun m!161801 () Bool)

(assert (=> b!109054 m!161801))

(declare-fun m!161803 () Bool)

(assert (=> b!109054 m!161803))

(declare-fun m!161805 () Bool)

(assert (=> b!109054 m!161805))

(declare-fun m!161807 () Bool)

(assert (=> b!109054 m!161807))

(declare-fun m!161809 () Bool)

(assert (=> b!109054 m!161809))

(declare-fun m!161811 () Bool)

(assert (=> b!109054 m!161811))

(declare-fun m!161813 () Bool)

(assert (=> b!109054 m!161813))

(declare-fun m!161815 () Bool)

(assert (=> b!109054 m!161815))

(declare-fun m!161817 () Bool)

(assert (=> b!109054 m!161817))

(declare-fun m!161819 () Bool)

(assert (=> b!109054 m!161819))

(declare-fun m!161821 () Bool)

(assert (=> b!109054 m!161821))

(declare-fun m!161823 () Bool)

(assert (=> b!109054 m!161823))

(declare-fun m!161825 () Bool)

(assert (=> b!109054 m!161825))

(declare-fun m!161827 () Bool)

(assert (=> b!109054 m!161827))

(declare-fun m!161829 () Bool)

(assert (=> b!109054 m!161829))

(declare-fun m!161831 () Bool)

(assert (=> b!109054 m!161831))

(declare-fun m!161833 () Bool)

(assert (=> b!109054 m!161833))

(declare-fun m!161835 () Bool)

(assert (=> b!109054 m!161835))

(declare-fun m!161837 () Bool)

(assert (=> b!109054 m!161837))

(push 1)

(assert (not b!109049))


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52746 () Bool)

(assert start!52746)

(declare-fun b!244033 () Bool)

(declare-fun res!203935 () Bool)

(declare-fun e!169137 () Bool)

(assert (=> b!244033 (=> (not res!203935) (not e!169137))))

(declare-datatypes ((array!13365 0))(
  ( (array!13366 (arr!6846 (Array (_ BitVec 32) (_ BitVec 8))) (size!5859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10640 0))(
  ( (BitStream!10641 (buf!6331 array!13365) (currentByte!11709 (_ BitVec 32)) (currentBit!11704 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17813 0))(
  ( (Unit!17814) )
))
(declare-datatypes ((tuple2!20916 0))(
  ( (tuple2!20917 (_1!11380 Unit!17813) (_2!11380 BitStream!10640)) )
))
(declare-fun lt!380385 () tuple2!20916)

(declare-fun lt!380379 () tuple2!20916)

(declare-fun isPrefixOf!0 (BitStream!10640 BitStream!10640) Bool)

(assert (=> b!244033 (= res!203935 (isPrefixOf!0 (_2!11380 lt!380385) (_2!11380 lt!380379)))))

(declare-fun b!244034 () Bool)

(declare-fun res!203936 () Bool)

(declare-fun e!169142 () Bool)

(assert (=> b!244034 (=> (not res!203936) (not e!169142))))

(declare-fun thiss!1005 () BitStream!10640)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244034 (= res!203936 (invariant!0 (currentBit!11704 thiss!1005) (currentByte!11709 thiss!1005) (size!5859 (buf!6331 (_2!11380 lt!380385)))))))

(declare-fun b!244035 () Bool)

(declare-fun e!169141 () Bool)

(declare-datatypes ((tuple2!20918 0))(
  ( (tuple2!20919 (_1!11381 BitStream!10640) (_2!11381 Bool)) )
))
(declare-fun lt!380388 () tuple2!20918)

(declare-fun lt!380380 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244035 (= e!169141 (= (bitIndex!0 (size!5859 (buf!6331 (_1!11381 lt!380388))) (currentByte!11709 (_1!11381 lt!380388)) (currentBit!11704 (_1!11381 lt!380388))) lt!380380))))

(declare-fun b!244037 () Bool)

(declare-fun e!169138 () Bool)

(assert (=> b!244037 (= e!169138 e!169141)))

(declare-fun res!203937 () Bool)

(assert (=> b!244037 (=> (not res!203937) (not e!169141))))

(declare-fun bit!26 () Bool)

(assert (=> b!244037 (= res!203937 (and (= (_2!11381 lt!380388) bit!26) (= (_1!11381 lt!380388) (_2!11380 lt!380385))))))

(declare-fun readBitPure!0 (BitStream!10640) tuple2!20918)

(declare-fun readerFrom!0 (BitStream!10640 (_ BitVec 32) (_ BitVec 32)) BitStream!10640)

(assert (=> b!244037 (= lt!380388 (readBitPure!0 (readerFrom!0 (_2!11380 lt!380385) (currentBit!11704 thiss!1005) (currentByte!11709 thiss!1005))))))

(declare-fun b!244038 () Bool)

(declare-fun res!203938 () Bool)

(assert (=> b!244038 (=> (not res!203938) (not e!169138))))

(assert (=> b!244038 (= res!203938 (isPrefixOf!0 thiss!1005 (_2!11380 lt!380385)))))

(declare-fun b!244039 () Bool)

(declare-fun e!169139 () Bool)

(assert (=> b!244039 (= e!169139 e!169137)))

(declare-fun res!203932 () Bool)

(assert (=> b!244039 (=> (not res!203932) (not e!169137))))

(declare-fun lt!380386 () (_ BitVec 64))

(assert (=> b!244039 (= res!203932 (= (bitIndex!0 (size!5859 (buf!6331 (_2!11380 lt!380379))) (currentByte!11709 (_2!11380 lt!380379)) (currentBit!11704 (_2!11380 lt!380379))) (bvadd (bitIndex!0 (size!5859 (buf!6331 (_2!11380 lt!380385))) (currentByte!11709 (_2!11380 lt!380385)) (currentBit!11704 (_2!11380 lt!380385))) lt!380386)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!244039 (= lt!380386 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244040 () Bool)

(assert (=> b!244040 (= e!169142 (invariant!0 (currentBit!11704 thiss!1005) (currentByte!11709 thiss!1005) (size!5859 (buf!6331 (_2!11380 lt!380379)))))))

(declare-fun b!244041 () Bool)

(declare-fun e!169134 () Bool)

(assert (=> b!244041 (= e!169134 (not true))))

(declare-fun lt!380387 () tuple2!20918)

(declare-datatypes ((tuple2!20920 0))(
  ( (tuple2!20921 (_1!11382 BitStream!10640) (_2!11382 BitStream!10640)) )
))
(declare-fun lt!380378 () tuple2!20920)

(declare-fun checkBitsLoopPure!0 (BitStream!10640 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20918)

(assert (=> b!244041 (= lt!380387 (checkBitsLoopPure!0 (_1!11382 lt!380378) nBits!297 bit!26 from!289))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244041 (validate_offset_bits!1 ((_ sign_extend 32) (size!5859 (buf!6331 (_2!11380 lt!380379)))) ((_ sign_extend 32) (currentByte!11709 thiss!1005)) ((_ sign_extend 32) (currentBit!11704 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380394 () Unit!17813)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10640 array!13365 (_ BitVec 64)) Unit!17813)

(assert (=> b!244041 (= lt!380394 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6331 (_2!11380 lt!380379)) (bvsub nBits!297 from!289)))))

(assert (=> b!244041 (= (_2!11381 (readBitPure!0 (_1!11382 lt!380378))) bit!26)))

(declare-fun lt!380392 () tuple2!20920)

(declare-fun reader!0 (BitStream!10640 BitStream!10640) tuple2!20920)

(assert (=> b!244041 (= lt!380392 (reader!0 (_2!11380 lt!380385) (_2!11380 lt!380379)))))

(assert (=> b!244041 (= lt!380378 (reader!0 thiss!1005 (_2!11380 lt!380379)))))

(declare-fun e!169133 () Bool)

(assert (=> b!244041 e!169133))

(declare-fun res!203940 () Bool)

(assert (=> b!244041 (=> (not res!203940) (not e!169133))))

(declare-fun lt!380377 () tuple2!20918)

(declare-fun lt!380390 () tuple2!20918)

(assert (=> b!244041 (= res!203940 (= (bitIndex!0 (size!5859 (buf!6331 (_1!11381 lt!380377))) (currentByte!11709 (_1!11381 lt!380377)) (currentBit!11704 (_1!11381 lt!380377))) (bitIndex!0 (size!5859 (buf!6331 (_1!11381 lt!380390))) (currentByte!11709 (_1!11381 lt!380390)) (currentBit!11704 (_1!11381 lt!380390)))))))

(declare-fun lt!380381 () Unit!17813)

(declare-fun lt!380382 () BitStream!10640)

(declare-fun readBitPrefixLemma!0 (BitStream!10640 BitStream!10640) Unit!17813)

(assert (=> b!244041 (= lt!380381 (readBitPrefixLemma!0 lt!380382 (_2!11380 lt!380379)))))

(assert (=> b!244041 (= lt!380390 (readBitPure!0 (BitStream!10641 (buf!6331 (_2!11380 lt!380379)) (currentByte!11709 thiss!1005) (currentBit!11704 thiss!1005))))))

(assert (=> b!244041 (= lt!380377 (readBitPure!0 lt!380382))))

(assert (=> b!244041 (= lt!380382 (BitStream!10641 (buf!6331 (_2!11380 lt!380385)) (currentByte!11709 thiss!1005) (currentBit!11704 thiss!1005)))))

(assert (=> b!244041 e!169142))

(declare-fun res!203930 () Bool)

(assert (=> b!244041 (=> (not res!203930) (not e!169142))))

(assert (=> b!244041 (= res!203930 (isPrefixOf!0 thiss!1005 (_2!11380 lt!380379)))))

(declare-fun lt!380376 () Unit!17813)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10640 BitStream!10640 BitStream!10640) Unit!17813)

(assert (=> b!244041 (= lt!380376 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11380 lt!380385) (_2!11380 lt!380379)))))

(assert (=> b!244041 e!169139))

(declare-fun res!203934 () Bool)

(assert (=> b!244041 (=> (not res!203934) (not e!169139))))

(assert (=> b!244041 (= res!203934 (= (size!5859 (buf!6331 (_2!11380 lt!380385))) (size!5859 (buf!6331 (_2!11380 lt!380379)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10640 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20916)

(assert (=> b!244041 (= lt!380379 (appendNBitsLoop!0 (_2!11380 lt!380385) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244041 (validate_offset_bits!1 ((_ sign_extend 32) (size!5859 (buf!6331 (_2!11380 lt!380385)))) ((_ sign_extend 32) (currentByte!11709 (_2!11380 lt!380385))) ((_ sign_extend 32) (currentBit!11704 (_2!11380 lt!380385))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380391 () Unit!17813)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10640 BitStream!10640 (_ BitVec 64) (_ BitVec 64)) Unit!17813)

(assert (=> b!244041 (= lt!380391 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11380 lt!380385) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169140 () Bool)

(assert (=> b!244041 e!169140))

(declare-fun res!203931 () Bool)

(assert (=> b!244041 (=> (not res!203931) (not e!169140))))

(assert (=> b!244041 (= res!203931 (= (size!5859 (buf!6331 thiss!1005)) (size!5859 (buf!6331 (_2!11380 lt!380385)))))))

(declare-fun appendBit!0 (BitStream!10640 Bool) tuple2!20916)

(assert (=> b!244041 (= lt!380385 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244042 () Bool)

(declare-fun lt!380383 () tuple2!20918)

(declare-fun lt!380393 () tuple2!20920)

(assert (=> b!244042 (= e!169137 (not (or (not (_2!11381 lt!380383)) (not (= (_1!11381 lt!380383) (_2!11382 lt!380393))))))))

(assert (=> b!244042 (= lt!380383 (checkBitsLoopPure!0 (_1!11382 lt!380393) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244042 (validate_offset_bits!1 ((_ sign_extend 32) (size!5859 (buf!6331 (_2!11380 lt!380379)))) ((_ sign_extend 32) (currentByte!11709 (_2!11380 lt!380385))) ((_ sign_extend 32) (currentBit!11704 (_2!11380 lt!380385))) lt!380386)))

(declare-fun lt!380384 () Unit!17813)

(assert (=> b!244042 (= lt!380384 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11380 lt!380385) (buf!6331 (_2!11380 lt!380379)) lt!380386))))

(assert (=> b!244042 (= lt!380393 (reader!0 (_2!11380 lt!380385) (_2!11380 lt!380379)))))

(declare-fun b!244036 () Bool)

(declare-fun e!169135 () Bool)

(declare-fun array_inv!5600 (array!13365) Bool)

(assert (=> b!244036 (= e!169135 (array_inv!5600 (buf!6331 thiss!1005)))))

(declare-fun res!203933 () Bool)

(assert (=> start!52746 (=> (not res!203933) (not e!169134))))

(assert (=> start!52746 (= res!203933 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52746 e!169134))

(assert (=> start!52746 true))

(declare-fun inv!12 (BitStream!10640) Bool)

(assert (=> start!52746 (and (inv!12 thiss!1005) e!169135)))

(declare-fun b!244043 () Bool)

(declare-fun res!203929 () Bool)

(assert (=> b!244043 (=> (not res!203929) (not e!169134))))

(assert (=> b!244043 (= res!203929 (validate_offset_bits!1 ((_ sign_extend 32) (size!5859 (buf!6331 thiss!1005))) ((_ sign_extend 32) (currentByte!11709 thiss!1005)) ((_ sign_extend 32) (currentBit!11704 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244044 () Bool)

(assert (=> b!244044 (= e!169133 (= (_2!11381 lt!380377) (_2!11381 lt!380390)))))

(declare-fun b!244045 () Bool)

(assert (=> b!244045 (= e!169140 e!169138)))

(declare-fun res!203928 () Bool)

(assert (=> b!244045 (=> (not res!203928) (not e!169138))))

(declare-fun lt!380389 () (_ BitVec 64))

(assert (=> b!244045 (= res!203928 (= lt!380380 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380389)))))

(assert (=> b!244045 (= lt!380380 (bitIndex!0 (size!5859 (buf!6331 (_2!11380 lt!380385))) (currentByte!11709 (_2!11380 lt!380385)) (currentBit!11704 (_2!11380 lt!380385))))))

(assert (=> b!244045 (= lt!380389 (bitIndex!0 (size!5859 (buf!6331 thiss!1005)) (currentByte!11709 thiss!1005) (currentBit!11704 thiss!1005)))))

(declare-fun b!244046 () Bool)

(declare-fun res!203939 () Bool)

(assert (=> b!244046 (=> (not res!203939) (not e!169134))))

(assert (=> b!244046 (= res!203939 (bvslt from!289 nBits!297))))

(assert (= (and start!52746 res!203933) b!244043))

(assert (= (and b!244043 res!203929) b!244046))

(assert (= (and b!244046 res!203939) b!244041))

(assert (= (and b!244041 res!203931) b!244045))

(assert (= (and b!244045 res!203928) b!244038))

(assert (= (and b!244038 res!203938) b!244037))

(assert (= (and b!244037 res!203937) b!244035))

(assert (= (and b!244041 res!203934) b!244039))

(assert (= (and b!244039 res!203932) b!244033))

(assert (= (and b!244033 res!203935) b!244042))

(assert (= (and b!244041 res!203930) b!244034))

(assert (= (and b!244034 res!203936) b!244040))

(assert (= (and b!244041 res!203940) b!244044))

(assert (= start!52746 b!244036))

(declare-fun m!367757 () Bool)

(assert (=> b!244034 m!367757))

(declare-fun m!367759 () Bool)

(assert (=> start!52746 m!367759))

(declare-fun m!367761 () Bool)

(assert (=> b!244035 m!367761))

(declare-fun m!367763 () Bool)

(assert (=> b!244037 m!367763))

(assert (=> b!244037 m!367763))

(declare-fun m!367765 () Bool)

(assert (=> b!244037 m!367765))

(declare-fun m!367767 () Bool)

(assert (=> b!244040 m!367767))

(declare-fun m!367769 () Bool)

(assert (=> b!244039 m!367769))

(declare-fun m!367771 () Bool)

(assert (=> b!244039 m!367771))

(assert (=> b!244045 m!367771))

(declare-fun m!367773 () Bool)

(assert (=> b!244045 m!367773))

(declare-fun m!367775 () Bool)

(assert (=> b!244038 m!367775))

(declare-fun m!367777 () Bool)

(assert (=> b!244033 m!367777))

(declare-fun m!367779 () Bool)

(assert (=> b!244036 m!367779))

(declare-fun m!367781 () Bool)

(assert (=> b!244042 m!367781))

(declare-fun m!367783 () Bool)

(assert (=> b!244042 m!367783))

(declare-fun m!367785 () Bool)

(assert (=> b!244042 m!367785))

(declare-fun m!367787 () Bool)

(assert (=> b!244042 m!367787))

(declare-fun m!367789 () Bool)

(assert (=> b!244041 m!367789))

(declare-fun m!367791 () Bool)

(assert (=> b!244041 m!367791))

(declare-fun m!367793 () Bool)

(assert (=> b!244041 m!367793))

(declare-fun m!367795 () Bool)

(assert (=> b!244041 m!367795))

(declare-fun m!367797 () Bool)

(assert (=> b!244041 m!367797))

(assert (=> b!244041 m!367787))

(declare-fun m!367799 () Bool)

(assert (=> b!244041 m!367799))

(declare-fun m!367801 () Bool)

(assert (=> b!244041 m!367801))

(declare-fun m!367803 () Bool)

(assert (=> b!244041 m!367803))

(declare-fun m!367805 () Bool)

(assert (=> b!244041 m!367805))

(declare-fun m!367807 () Bool)

(assert (=> b!244041 m!367807))

(declare-fun m!367809 () Bool)

(assert (=> b!244041 m!367809))

(declare-fun m!367811 () Bool)

(assert (=> b!244041 m!367811))

(declare-fun m!367813 () Bool)

(assert (=> b!244041 m!367813))

(declare-fun m!367815 () Bool)

(assert (=> b!244041 m!367815))

(declare-fun m!367817 () Bool)

(assert (=> b!244041 m!367817))

(declare-fun m!367819 () Bool)

(assert (=> b!244041 m!367819))

(declare-fun m!367821 () Bool)

(assert (=> b!244043 m!367821))

(push 1)

(assert (not b!244033))

(assert (not b!244038))

(assert (not b!244045))

(assert (not b!244042))

(assert (not b!244040))

(assert (not b!244035))

(assert (not b!244037))

(assert (not b!244039))

(assert (not b!244036))

(assert (not b!244043))

(assert (not b!244041))

(assert (not b!244034))


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28028 () Bool)

(assert start!28028)

(declare-fun b!145430 () Bool)

(declare-fun e!96968 () Bool)

(declare-datatypes ((array!6620 0))(
  ( (array!6621 (arr!3731 (Array (_ BitVec 32) (_ BitVec 8))) (size!2998 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5254 0))(
  ( (BitStream!5255 (buf!3437 array!6620) (currentByte!6327 (_ BitVec 32)) (currentBit!6322 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5254)

(declare-datatypes ((Unit!9069 0))(
  ( (Unit!9070) )
))
(declare-datatypes ((tuple2!13026 0))(
  ( (tuple2!13027 (_1!6859 Unit!9069) (_2!6859 BitStream!5254)) )
))
(declare-fun lt!225259 () tuple2!13026)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145430 (= e!96968 (invariant!0 (currentBit!6322 thiss!1634) (currentByte!6327 thiss!1634) (size!2998 (buf!3437 (_2!6859 lt!225259)))))))

(declare-fun b!145431 () Bool)

(declare-fun e!96974 () Bool)

(declare-fun e!96970 () Bool)

(assert (=> b!145431 (= e!96974 (not e!96970))))

(declare-fun res!121614 () Bool)

(assert (=> b!145431 (=> res!121614 e!96970)))

(declare-fun arr!237 () array!6620)

(declare-datatypes ((tuple2!13028 0))(
  ( (tuple2!13029 (_1!6860 BitStream!5254) (_2!6860 BitStream!5254)) )
))
(declare-fun lt!225265 () tuple2!13028)

(declare-datatypes ((tuple2!13030 0))(
  ( (tuple2!13031 (_1!6861 BitStream!5254) (_2!6861 array!6620)) )
))
(declare-fun lt!225262 () tuple2!13030)

(assert (=> b!145431 (= res!121614 (or (not (= (size!2998 (_2!6861 lt!225262)) (size!2998 arr!237))) (not (= (_1!6861 lt!225262) (_2!6860 lt!225265)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5254 array!6620 (_ BitVec 32) (_ BitVec 32)) tuple2!13030)

(assert (=> b!145431 (= lt!225262 (readByteArrayLoopPure!0 (_1!6860 lt!225265) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225255 () tuple2!13026)

(declare-fun lt!225263 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145431 (validate_offset_bits!1 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225263)))

(declare-fun lt!225260 () Unit!9069)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5254 array!6620 (_ BitVec 64)) Unit!9069)

(assert (=> b!145431 (= lt!225260 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225255)) lt!225263))))

(declare-fun reader!0 (BitStream!5254 BitStream!5254) tuple2!13028)

(assert (=> b!145431 (= lt!225265 (reader!0 (_2!6859 lt!225259) (_2!6859 lt!225255)))))

(declare-fun b!145432 () Bool)

(declare-fun e!96969 () Bool)

(declare-fun lt!225269 () tuple2!13028)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145432 (= e!96969 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6860 lt!225269)))) ((_ sign_extend 32) (currentByte!6327 (_1!6860 lt!225269))) ((_ sign_extend 32) (currentBit!6322 (_1!6860 lt!225269))) (bvsub to!404 from!447))))))

(declare-fun lt!225250 () tuple2!13028)

(declare-datatypes ((tuple2!13032 0))(
  ( (tuple2!13033 (_1!6862 BitStream!5254) (_2!6862 (_ BitVec 8))) )
))
(declare-fun lt!225270 () tuple2!13032)

(declare-fun lt!225267 () tuple2!13030)

(assert (=> b!145432 (= lt!225267 (readByteArrayLoopPure!0 (_1!6860 lt!225250) (array!6621 (store (arr!3731 arr!237) from!447 (_2!6862 lt!225270)) (size!2998 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225264 () (_ BitVec 32))

(assert (=> b!145432 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225264)))

(declare-fun lt!225254 () Unit!9069)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5254 array!6620 (_ BitVec 32)) Unit!9069)

(assert (=> b!145432 (= lt!225254 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225255)) lt!225264))))

(declare-fun e!96967 () Bool)

(assert (=> b!145432 e!96967))

(declare-fun res!121615 () Bool)

(assert (=> b!145432 (=> (not res!121615) (not e!96967))))

(assert (=> b!145432 (= res!121615 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225252 () Unit!9069)

(assert (=> b!145432 (= lt!225252 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3437 (_2!6859 lt!225255)) (bvsub to!404 from!447)))))

(assert (=> b!145432 (= (_2!6862 lt!225270) (select (arr!3731 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5254) tuple2!13032)

(assert (=> b!145432 (= lt!225270 (readBytePure!0 (_1!6860 lt!225269)))))

(assert (=> b!145432 (= lt!225250 (reader!0 (_2!6859 lt!225259) (_2!6859 lt!225255)))))

(assert (=> b!145432 (= lt!225269 (reader!0 thiss!1634 (_2!6859 lt!225255)))))

(declare-fun e!96966 () Bool)

(assert (=> b!145432 e!96966))

(declare-fun res!121612 () Bool)

(assert (=> b!145432 (=> (not res!121612) (not e!96966))))

(declare-fun lt!225257 () tuple2!13032)

(declare-fun lt!225268 () tuple2!13032)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145432 (= res!121612 (= (bitIndex!0 (size!2998 (buf!3437 (_1!6862 lt!225257))) (currentByte!6327 (_1!6862 lt!225257)) (currentBit!6322 (_1!6862 lt!225257))) (bitIndex!0 (size!2998 (buf!3437 (_1!6862 lt!225268))) (currentByte!6327 (_1!6862 lt!225268)) (currentBit!6322 (_1!6862 lt!225268)))))))

(declare-fun lt!225258 () Unit!9069)

(declare-fun lt!225266 () BitStream!5254)

(declare-fun readBytePrefixLemma!0 (BitStream!5254 BitStream!5254) Unit!9069)

(assert (=> b!145432 (= lt!225258 (readBytePrefixLemma!0 lt!225266 (_2!6859 lt!225255)))))

(assert (=> b!145432 (= lt!225268 (readBytePure!0 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634))))))

(assert (=> b!145432 (= lt!225257 (readBytePure!0 lt!225266))))

(assert (=> b!145432 (= lt!225266 (BitStream!5255 (buf!3437 (_2!6859 lt!225259)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(assert (=> b!145432 e!96968))

(declare-fun res!121616 () Bool)

(assert (=> b!145432 (=> (not res!121616) (not e!96968))))

(declare-fun isPrefixOf!0 (BitStream!5254 BitStream!5254) Bool)

(assert (=> b!145432 (= res!121616 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225255)))))

(declare-fun lt!225256 () Unit!9069)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5254 BitStream!5254 BitStream!5254) Unit!9069)

(assert (=> b!145432 (= lt!225256 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6859 lt!225259) (_2!6859 lt!225255)))))

(declare-fun e!96972 () Bool)

(assert (=> b!145432 e!96972))

(declare-fun res!121606 () Bool)

(assert (=> b!145432 (=> (not res!121606) (not e!96972))))

(assert (=> b!145432 (= res!121606 (= (size!2998 (buf!3437 (_2!6859 lt!225259))) (size!2998 (buf!3437 (_2!6859 lt!225255)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5254 array!6620 (_ BitVec 32) (_ BitVec 32)) tuple2!13026)

(assert (=> b!145432 (= lt!225255 (appendByteArrayLoop!0 (_2!6859 lt!225259) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145432 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225264)))

(assert (=> b!145432 (= lt!225264 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225251 () Unit!9069)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5254 BitStream!5254 (_ BitVec 64) (_ BitVec 32)) Unit!9069)

(assert (=> b!145432 (= lt!225251 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6859 lt!225259) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96971 () Bool)

(assert (=> b!145432 e!96971))

(declare-fun res!121618 () Bool)

(assert (=> b!145432 (=> (not res!121618) (not e!96971))))

(assert (=> b!145432 (= res!121618 (= (size!2998 (buf!3437 thiss!1634)) (size!2998 (buf!3437 (_2!6859 lt!225259)))))))

(declare-fun appendByte!0 (BitStream!5254 (_ BitVec 8)) tuple2!13026)

(assert (=> b!145432 (= lt!225259 (appendByte!0 thiss!1634 (select (arr!3731 arr!237) from!447)))))

(declare-fun b!145433 () Bool)

(declare-fun res!121605 () Bool)

(assert (=> b!145433 (=> (not res!121605) (not e!96974))))

(assert (=> b!145433 (= res!121605 (isPrefixOf!0 (_2!6859 lt!225259) (_2!6859 lt!225255)))))

(declare-fun b!145434 () Bool)

(declare-fun res!121608 () Bool)

(assert (=> b!145434 (=> (not res!121608) (not e!96969))))

(assert (=> b!145434 (= res!121608 (invariant!0 (currentBit!6322 thiss!1634) (currentByte!6327 thiss!1634) (size!2998 (buf!3437 thiss!1634))))))

(declare-fun b!145436 () Bool)

(declare-fun e!96973 () Bool)

(declare-fun array_inv!2787 (array!6620) Bool)

(assert (=> b!145436 (= e!96973 (array_inv!2787 (buf!3437 thiss!1634)))))

(declare-fun b!145437 () Bool)

(declare-fun res!121609 () Bool)

(assert (=> b!145437 (=> (not res!121609) (not e!96971))))

(assert (=> b!145437 (= res!121609 (= (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))))

(declare-fun b!145438 () Bool)

(assert (=> b!145438 (= e!96966 (= (_2!6862 lt!225257) (_2!6862 lt!225268)))))

(declare-fun b!145439 () Bool)

(assert (=> b!145439 (= e!96967 (= (_1!6861 (readByteArrayLoopPure!0 (_1!6860 lt!225269) arr!237 from!447 to!404)) (_2!6860 lt!225269)))))

(declare-fun b!145440 () Bool)

(declare-fun arrayRangesEq!314 (array!6620 array!6620 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145440 (= e!96970 (not (arrayRangesEq!314 arr!237 (_2!6861 lt!225262) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!225261 () tuple2!13028)

(declare-fun lt!225253 () tuple2!13032)

(declare-fun b!145435 () Bool)

(assert (=> b!145435 (= e!96971 (and (= (_2!6862 lt!225253) (select (arr!3731 arr!237) from!447)) (= (_1!6862 lt!225253) (_2!6860 lt!225261))))))

(assert (=> b!145435 (= lt!225253 (readBytePure!0 (_1!6860 lt!225261)))))

(assert (=> b!145435 (= lt!225261 (reader!0 thiss!1634 (_2!6859 lt!225259)))))

(declare-fun res!121611 () Bool)

(assert (=> start!28028 (=> (not res!121611) (not e!96969))))

(assert (=> start!28028 (= res!121611 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2998 arr!237))))))

(assert (=> start!28028 e!96969))

(assert (=> start!28028 true))

(assert (=> start!28028 (array_inv!2787 arr!237)))

(declare-fun inv!12 (BitStream!5254) Bool)

(assert (=> start!28028 (and (inv!12 thiss!1634) e!96973)))

(declare-fun b!145441 () Bool)

(assert (=> b!145441 (= e!96972 e!96974)))

(declare-fun res!121613 () Bool)

(assert (=> b!145441 (=> (not res!121613) (not e!96974))))

(assert (=> b!145441 (= res!121613 (= (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225255))) (currentByte!6327 (_2!6859 lt!225255)) (currentBit!6322 (_2!6859 lt!225255))) (bvadd (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225263))))))

(assert (=> b!145441 (= lt!225263 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145442 () Bool)

(declare-fun res!121607 () Bool)

(assert (=> b!145442 (=> (not res!121607) (not e!96969))))

(assert (=> b!145442 (= res!121607 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145443 () Bool)

(declare-fun res!121610 () Bool)

(assert (=> b!145443 (=> (not res!121610) (not e!96969))))

(assert (=> b!145443 (= res!121610 (bvslt from!447 to!404))))

(declare-fun b!145444 () Bool)

(declare-fun res!121617 () Bool)

(assert (=> b!145444 (=> (not res!121617) (not e!96971))))

(assert (=> b!145444 (= res!121617 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225259)))))

(assert (= (and start!28028 res!121611) b!145442))

(assert (= (and b!145442 res!121607) b!145443))

(assert (= (and b!145443 res!121610) b!145434))

(assert (= (and b!145434 res!121608) b!145432))

(assert (= (and b!145432 res!121618) b!145437))

(assert (= (and b!145437 res!121609) b!145444))

(assert (= (and b!145444 res!121617) b!145435))

(assert (= (and b!145432 res!121606) b!145441))

(assert (= (and b!145441 res!121613) b!145433))

(assert (= (and b!145433 res!121605) b!145431))

(assert (= (and b!145431 (not res!121614)) b!145440))

(assert (= (and b!145432 res!121616) b!145430))

(assert (= (and b!145432 res!121612) b!145438))

(assert (= (and b!145432 res!121615) b!145439))

(assert (= start!28028 b!145436))

(declare-fun m!223739 () Bool)

(assert (=> b!145433 m!223739))

(declare-fun m!223741 () Bool)

(assert (=> b!145434 m!223741))

(declare-fun m!223743 () Bool)

(assert (=> b!145436 m!223743))

(declare-fun m!223745 () Bool)

(assert (=> b!145432 m!223745))

(declare-fun m!223747 () Bool)

(assert (=> b!145432 m!223747))

(declare-fun m!223749 () Bool)

(assert (=> b!145432 m!223749))

(declare-fun m!223751 () Bool)

(assert (=> b!145432 m!223751))

(declare-fun m!223753 () Bool)

(assert (=> b!145432 m!223753))

(declare-fun m!223755 () Bool)

(assert (=> b!145432 m!223755))

(declare-fun m!223757 () Bool)

(assert (=> b!145432 m!223757))

(declare-fun m!223759 () Bool)

(assert (=> b!145432 m!223759))

(declare-fun m!223761 () Bool)

(assert (=> b!145432 m!223761))

(declare-fun m!223763 () Bool)

(assert (=> b!145432 m!223763))

(declare-fun m!223765 () Bool)

(assert (=> b!145432 m!223765))

(declare-fun m!223767 () Bool)

(assert (=> b!145432 m!223767))

(declare-fun m!223769 () Bool)

(assert (=> b!145432 m!223769))

(declare-fun m!223771 () Bool)

(assert (=> b!145432 m!223771))

(declare-fun m!223773 () Bool)

(assert (=> b!145432 m!223773))

(declare-fun m!223775 () Bool)

(assert (=> b!145432 m!223775))

(declare-fun m!223777 () Bool)

(assert (=> b!145432 m!223777))

(declare-fun m!223779 () Bool)

(assert (=> b!145432 m!223779))

(declare-fun m!223781 () Bool)

(assert (=> b!145432 m!223781))

(declare-fun m!223783 () Bool)

(assert (=> b!145432 m!223783))

(assert (=> b!145432 m!223763))

(declare-fun m!223785 () Bool)

(assert (=> b!145432 m!223785))

(declare-fun m!223787 () Bool)

(assert (=> b!145432 m!223787))

(declare-fun m!223789 () Bool)

(assert (=> b!145439 m!223789))

(declare-fun m!223791 () Bool)

(assert (=> b!145431 m!223791))

(declare-fun m!223793 () Bool)

(assert (=> b!145431 m!223793))

(declare-fun m!223795 () Bool)

(assert (=> b!145431 m!223795))

(assert (=> b!145431 m!223777))

(declare-fun m!223797 () Bool)

(assert (=> b!145430 m!223797))

(assert (=> b!145435 m!223763))

(declare-fun m!223799 () Bool)

(assert (=> b!145435 m!223799))

(declare-fun m!223801 () Bool)

(assert (=> b!145435 m!223801))

(declare-fun m!223803 () Bool)

(assert (=> b!145442 m!223803))

(declare-fun m!223805 () Bool)

(assert (=> b!145440 m!223805))

(declare-fun m!223807 () Bool)

(assert (=> b!145441 m!223807))

(declare-fun m!223809 () Bool)

(assert (=> b!145441 m!223809))

(assert (=> b!145437 m!223809))

(declare-fun m!223811 () Bool)

(assert (=> b!145437 m!223811))

(declare-fun m!223813 () Bool)

(assert (=> start!28028 m!223813))

(declare-fun m!223815 () Bool)

(assert (=> start!28028 m!223815))

(declare-fun m!223817 () Bool)

(assert (=> b!145444 m!223817))

(push 1)

(assert (not b!145439))

(assert (not b!145432))

(assert (not b!145430))

(assert (not b!145431))

(assert (not b!145440))

(assert (not b!145433))

(assert (not b!145444))

(assert (not b!145442))

(assert (not b!145436))

(assert (not b!145434))

(assert (not b!145435))

(assert (not b!145437))

(assert (not b!145441))

(assert (not start!28028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!46409 () Bool)

(assert (=> d!46409 (= (array_inv!2787 (buf!3437 thiss!1634)) (bvsge (size!2998 (buf!3437 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!145436 d!46409))

(declare-fun d!46411 () Bool)

(declare-fun e!97044 () Bool)

(assert (=> d!46411 e!97044))

(declare-fun res!121708 () Bool)

(assert (=> d!46411 (=> (not res!121708) (not e!97044))))

(declare-fun lt!225412 () (_ BitVec 64))

(declare-fun lt!225410 () (_ BitVec 64))

(declare-fun lt!225409 () (_ BitVec 64))

(assert (=> d!46411 (= res!121708 (= lt!225412 (bvsub lt!225409 lt!225410)))))

(assert (=> d!46411 (or (= (bvand lt!225409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225410 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225409 lt!225410) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!46411 (= lt!225410 (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259)))))))

(declare-fun lt!225413 () (_ BitVec 64))

(declare-fun lt!225411 () (_ BitVec 64))

(assert (=> d!46411 (= lt!225409 (bvmul lt!225413 lt!225411))))

(assert (=> d!46411 (or (= lt!225413 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225411 (bvsdiv (bvmul lt!225413 lt!225411) lt!225413)))))

(assert (=> d!46411 (= lt!225411 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46411 (= lt!225413 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))))))

(assert (=> d!46411 (= lt!225412 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259)))))))

(assert (=> d!46411 (invariant!0 (currentBit!6322 (_2!6859 lt!225259)) (currentByte!6327 (_2!6859 lt!225259)) (size!2998 (buf!3437 (_2!6859 lt!225259))))))

(assert (=> d!46411 (= (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))) lt!225412)))

(declare-fun b!145539 () Bool)

(declare-fun res!121707 () Bool)

(assert (=> b!145539 (=> (not res!121707) (not e!97044))))

(assert (=> b!145539 (= res!121707 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225412))))

(declare-fun b!145540 () Bool)

(declare-fun lt!225414 () (_ BitVec 64))

(assert (=> b!145540 (= e!97044 (bvsle lt!225412 (bvmul lt!225414 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145540 (or (= lt!225414 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225414 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225414)))))

(assert (=> b!145540 (= lt!225414 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))))))

(assert (= (and d!46411 res!121708) b!145539))

(assert (= (and b!145539 res!121707) b!145540))

(declare-fun m!223979 () Bool)

(assert (=> d!46411 m!223979))

(declare-fun m!223981 () Bool)

(assert (=> d!46411 m!223981))

(assert (=> b!145437 d!46411))

(declare-fun d!46413 () Bool)

(declare-fun e!97045 () Bool)

(assert (=> d!46413 e!97045))

(declare-fun res!121710 () Bool)

(assert (=> d!46413 (=> (not res!121710) (not e!97045))))

(declare-fun lt!225418 () (_ BitVec 64))

(declare-fun lt!225416 () (_ BitVec 64))

(declare-fun lt!225415 () (_ BitVec 64))

(assert (=> d!46413 (= res!121710 (= lt!225418 (bvsub lt!225415 lt!225416)))))

(assert (=> d!46413 (or (= (bvand lt!225415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225415 lt!225416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46413 (= lt!225416 (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634))))))

(declare-fun lt!225419 () (_ BitVec 64))

(declare-fun lt!225417 () (_ BitVec 64))

(assert (=> d!46413 (= lt!225415 (bvmul lt!225419 lt!225417))))

(assert (=> d!46413 (or (= lt!225419 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225417 (bvsdiv (bvmul lt!225419 lt!225417) lt!225419)))))

(assert (=> d!46413 (= lt!225417 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46413 (= lt!225419 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))))))

(assert (=> d!46413 (= lt!225418 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6327 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6322 thiss!1634))))))

(assert (=> d!46413 (invariant!0 (currentBit!6322 thiss!1634) (currentByte!6327 thiss!1634) (size!2998 (buf!3437 thiss!1634)))))

(assert (=> d!46413 (= (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)) lt!225418)))

(declare-fun b!145541 () Bool)

(declare-fun res!121709 () Bool)

(assert (=> b!145541 (=> (not res!121709) (not e!97045))))

(assert (=> b!145541 (= res!121709 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225418))))

(declare-fun b!145542 () Bool)

(declare-fun lt!225420 () (_ BitVec 64))

(assert (=> b!145542 (= e!97045 (bvsle lt!225418 (bvmul lt!225420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145542 (or (= lt!225420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225420)))))

(assert (=> b!145542 (= lt!225420 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))))))

(assert (= (and d!46413 res!121710) b!145541))

(assert (= (and b!145541 res!121709) b!145542))

(declare-fun m!223983 () Bool)

(assert (=> d!46413 m!223983))

(assert (=> d!46413 m!223741))

(assert (=> b!145437 d!46413))

(declare-fun d!46415 () Bool)

(declare-datatypes ((tuple2!13050 0))(
  ( (tuple2!13051 (_1!6871 (_ BitVec 8)) (_2!6871 BitStream!5254)) )
))
(declare-fun lt!225423 () tuple2!13050)

(declare-fun readByte!0 (BitStream!5254) tuple2!13050)

(assert (=> d!46415 (= lt!225423 (readByte!0 (_1!6860 lt!225261)))))

(assert (=> d!46415 (= (readBytePure!0 (_1!6860 lt!225261)) (tuple2!13033 (_2!6871 lt!225423) (_1!6871 lt!225423)))))

(declare-fun bs!11384 () Bool)

(assert (= bs!11384 d!46415))

(declare-fun m!223985 () Bool)

(assert (=> bs!11384 m!223985))

(assert (=> b!145435 d!46415))

(declare-fun d!46417 () Bool)

(declare-fun e!97050 () Bool)

(assert (=> d!46417 e!97050))

(declare-fun res!121717 () Bool)

(assert (=> d!46417 (=> (not res!121717) (not e!97050))))

(declare-fun lt!225467 () tuple2!13028)

(assert (=> d!46417 (= res!121717 (isPrefixOf!0 (_1!6860 lt!225467) (_2!6860 lt!225467)))))

(declare-fun lt!225480 () BitStream!5254)

(assert (=> d!46417 (= lt!225467 (tuple2!13029 lt!225480 (_2!6859 lt!225259)))))

(declare-fun lt!225466 () Unit!9069)

(declare-fun lt!225469 () Unit!9069)

(assert (=> d!46417 (= lt!225466 lt!225469)))

(assert (=> d!46417 (isPrefixOf!0 lt!225480 (_2!6859 lt!225259))))

(assert (=> d!46417 (= lt!225469 (lemmaIsPrefixTransitive!0 lt!225480 (_2!6859 lt!225259) (_2!6859 lt!225259)))))

(declare-fun lt!225475 () Unit!9069)

(declare-fun lt!225464 () Unit!9069)

(assert (=> d!46417 (= lt!225475 lt!225464)))

(assert (=> d!46417 (isPrefixOf!0 lt!225480 (_2!6859 lt!225259))))

(assert (=> d!46417 (= lt!225464 (lemmaIsPrefixTransitive!0 lt!225480 thiss!1634 (_2!6859 lt!225259)))))

(declare-fun lt!225472 () Unit!9069)

(declare-fun e!97051 () Unit!9069)

(assert (=> d!46417 (= lt!225472 e!97051)))

(declare-fun c!7888 () Bool)

(assert (=> d!46417 (= c!7888 (not (= (size!2998 (buf!3437 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!225478 () Unit!9069)

(declare-fun lt!225483 () Unit!9069)

(assert (=> d!46417 (= lt!225478 lt!225483)))

(assert (=> d!46417 (isPrefixOf!0 (_2!6859 lt!225259) (_2!6859 lt!225259))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5254) Unit!9069)

(assert (=> d!46417 (= lt!225483 (lemmaIsPrefixRefl!0 (_2!6859 lt!225259)))))

(declare-fun lt!225482 () Unit!9069)

(declare-fun lt!225476 () Unit!9069)

(assert (=> d!46417 (= lt!225482 lt!225476)))

(assert (=> d!46417 (= lt!225476 (lemmaIsPrefixRefl!0 (_2!6859 lt!225259)))))

(declare-fun lt!225479 () Unit!9069)

(declare-fun lt!225465 () Unit!9069)

(assert (=> d!46417 (= lt!225479 lt!225465)))

(assert (=> d!46417 (isPrefixOf!0 lt!225480 lt!225480)))

(assert (=> d!46417 (= lt!225465 (lemmaIsPrefixRefl!0 lt!225480))))

(declare-fun lt!225471 () Unit!9069)

(declare-fun lt!225474 () Unit!9069)

(assert (=> d!46417 (= lt!225471 lt!225474)))

(assert (=> d!46417 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46417 (= lt!225474 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46417 (= lt!225480 (BitStream!5255 (buf!3437 (_2!6859 lt!225259)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(assert (=> d!46417 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225259))))

(assert (=> d!46417 (= (reader!0 thiss!1634 (_2!6859 lt!225259)) lt!225467)))

(declare-fun b!145553 () Bool)

(declare-fun res!121718 () Bool)

(assert (=> b!145553 (=> (not res!121718) (not e!97050))))

(assert (=> b!145553 (= res!121718 (isPrefixOf!0 (_1!6860 lt!225467) thiss!1634))))

(declare-fun lt!225468 () (_ BitVec 64))

(declare-fun lt!225473 () (_ BitVec 64))

(declare-fun b!145554 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5254 (_ BitVec 64)) BitStream!5254)

(assert (=> b!145554 (= e!97050 (= (_1!6860 lt!225467) (withMovedBitIndex!0 (_2!6860 lt!225467) (bvsub lt!225473 lt!225468))))))

(assert (=> b!145554 (or (= (bvand lt!225473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225473 lt!225468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145554 (= lt!225468 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))))))

(assert (=> b!145554 (= lt!225473 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(declare-fun b!145555 () Bool)

(declare-fun Unit!9075 () Unit!9069)

(assert (=> b!145555 (= e!97051 Unit!9075)))

(declare-fun b!145556 () Bool)

(declare-fun lt!225470 () Unit!9069)

(assert (=> b!145556 (= e!97051 lt!225470)))

(declare-fun lt!225477 () (_ BitVec 64))

(assert (=> b!145556 (= lt!225477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225481 () (_ BitVec 64))

(assert (=> b!145556 (= lt!225481 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6620 array!6620 (_ BitVec 64) (_ BitVec 64)) Unit!9069)

(assert (=> b!145556 (= lt!225470 (arrayBitRangesEqSymmetric!0 (buf!3437 thiss!1634) (buf!3437 (_2!6859 lt!225259)) lt!225477 lt!225481))))

(declare-fun arrayBitRangesEq!0 (array!6620 array!6620 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145556 (arrayBitRangesEq!0 (buf!3437 (_2!6859 lt!225259)) (buf!3437 thiss!1634) lt!225477 lt!225481)))

(declare-fun b!145557 () Bool)

(declare-fun res!121719 () Bool)

(assert (=> b!145557 (=> (not res!121719) (not e!97050))))

(assert (=> b!145557 (= res!121719 (isPrefixOf!0 (_2!6860 lt!225467) (_2!6859 lt!225259)))))

(assert (= (and d!46417 c!7888) b!145556))

(assert (= (and d!46417 (not c!7888)) b!145555))

(assert (= (and d!46417 res!121717) b!145553))

(assert (= (and b!145553 res!121718) b!145557))

(assert (= (and b!145557 res!121719) b!145554))

(declare-fun m!223987 () Bool)

(assert (=> b!145553 m!223987))

(declare-fun m!223989 () Bool)

(assert (=> d!46417 m!223989))

(declare-fun m!223991 () Bool)

(assert (=> d!46417 m!223991))

(declare-fun m!223993 () Bool)

(assert (=> d!46417 m!223993))

(declare-fun m!223995 () Bool)

(assert (=> d!46417 m!223995))

(declare-fun m!223997 () Bool)

(assert (=> d!46417 m!223997))

(declare-fun m!223999 () Bool)

(assert (=> d!46417 m!223999))

(declare-fun m!224001 () Bool)

(assert (=> d!46417 m!224001))

(assert (=> d!46417 m!223817))

(declare-fun m!224003 () Bool)

(assert (=> d!46417 m!224003))

(declare-fun m!224005 () Bool)

(assert (=> d!46417 m!224005))

(declare-fun m!224007 () Bool)

(assert (=> d!46417 m!224007))

(declare-fun m!224009 () Bool)

(assert (=> b!145557 m!224009))

(declare-fun m!224011 () Bool)

(assert (=> b!145554 m!224011))

(assert (=> b!145554 m!223809))

(assert (=> b!145554 m!223811))

(assert (=> b!145556 m!223811))

(declare-fun m!224013 () Bool)

(assert (=> b!145556 m!224013))

(declare-fun m!224015 () Bool)

(assert (=> b!145556 m!224015))

(assert (=> b!145435 d!46417))

(declare-fun d!46419 () Bool)

(declare-fun res!121727 () Bool)

(declare-fun e!97056 () Bool)

(assert (=> d!46419 (=> (not res!121727) (not e!97056))))

(assert (=> d!46419 (= res!121727 (= (size!2998 (buf!3437 thiss!1634)) (size!2998 (buf!3437 (_2!6859 lt!225259)))))))

(assert (=> d!46419 (= (isPrefixOf!0 thiss!1634 (_2!6859 lt!225259)) e!97056)))

(declare-fun b!145564 () Bool)

(declare-fun res!121728 () Bool)

(assert (=> b!145564 (=> (not res!121728) (not e!97056))))

(assert (=> b!145564 (= res!121728 (bvsle (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)) (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259)))))))

(declare-fun b!145565 () Bool)

(declare-fun e!97057 () Bool)

(assert (=> b!145565 (= e!97056 e!97057)))

(declare-fun res!121726 () Bool)

(assert (=> b!145565 (=> res!121726 e!97057)))

(assert (=> b!145565 (= res!121726 (= (size!2998 (buf!3437 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145566 () Bool)

(assert (=> b!145566 (= e!97057 (arrayBitRangesEq!0 (buf!3437 thiss!1634) (buf!3437 (_2!6859 lt!225259)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634))))))

(assert (= (and d!46419 res!121727) b!145564))

(assert (= (and b!145564 res!121728) b!145565))

(assert (= (and b!145565 (not res!121726)) b!145566))

(assert (=> b!145564 m!223811))

(assert (=> b!145564 m!223809))

(assert (=> b!145566 m!223811))

(assert (=> b!145566 m!223811))

(declare-fun m!224017 () Bool)

(assert (=> b!145566 m!224017))

(assert (=> b!145444 d!46419))

(declare-fun d!46421 () Bool)

(assert (=> d!46421 (= (invariant!0 (currentBit!6322 thiss!1634) (currentByte!6327 thiss!1634) (size!2998 (buf!3437 thiss!1634))) (and (bvsge (currentBit!6322 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6322 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6327 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6327 thiss!1634) (size!2998 (buf!3437 thiss!1634))) (and (= (currentBit!6322 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6327 thiss!1634) (size!2998 (buf!3437 thiss!1634)))))))))

(assert (=> b!145434 d!46421))

(declare-fun d!46423 () Bool)

(assert (=> d!46423 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225264) (bvsle ((_ sign_extend 32) lt!225264) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11385 () Bool)

(assert (= bs!11385 d!46423))

(declare-fun m!224019 () Bool)

(assert (=> bs!11385 m!224019))

(assert (=> b!145432 d!46423))

(declare-fun d!46425 () Bool)

(assert (=> d!46425 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225255))))

(declare-fun lt!225486 () Unit!9069)

(declare-fun choose!30 (BitStream!5254 BitStream!5254 BitStream!5254) Unit!9069)

(assert (=> d!46425 (= lt!225486 (choose!30 thiss!1634 (_2!6859 lt!225259) (_2!6859 lt!225255)))))

(assert (=> d!46425 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225259))))

(assert (=> d!46425 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6859 lt!225259) (_2!6859 lt!225255)) lt!225486)))

(declare-fun bs!11386 () Bool)

(assert (= bs!11386 d!46425))

(assert (=> bs!11386 m!223747))

(declare-fun m!224021 () Bool)

(assert (=> bs!11386 m!224021))

(assert (=> bs!11386 m!223817))

(assert (=> b!145432 d!46425))

(declare-fun d!46427 () Bool)

(declare-datatypes ((tuple3!558 0))(
  ( (tuple3!559 (_1!6872 Unit!9069) (_2!6872 BitStream!5254) (_3!346 array!6620)) )
))
(declare-fun lt!225489 () tuple3!558)

(declare-fun readByteArrayLoop!0 (BitStream!5254 array!6620 (_ BitVec 32) (_ BitVec 32)) tuple3!558)

(assert (=> d!46427 (= lt!225489 (readByteArrayLoop!0 (_1!6860 lt!225250) (array!6621 (store (arr!3731 arr!237) from!447 (_2!6862 lt!225270)) (size!2998 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46427 (= (readByteArrayLoopPure!0 (_1!6860 lt!225250) (array!6621 (store (arr!3731 arr!237) from!447 (_2!6862 lt!225270)) (size!2998 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13031 (_2!6872 lt!225489) (_3!346 lt!225489)))))

(declare-fun bs!11387 () Bool)

(assert (= bs!11387 d!46427))

(declare-fun m!224023 () Bool)

(assert (=> bs!11387 m!224023))

(assert (=> b!145432 d!46427))

(declare-fun d!46429 () Bool)

(declare-fun e!97058 () Bool)

(assert (=> d!46429 e!97058))

(declare-fun res!121730 () Bool)

(assert (=> d!46429 (=> (not res!121730) (not e!97058))))

(declare-fun lt!225490 () (_ BitVec 64))

(declare-fun lt!225491 () (_ BitVec 64))

(declare-fun lt!225493 () (_ BitVec 64))

(assert (=> d!46429 (= res!121730 (= lt!225493 (bvsub lt!225490 lt!225491)))))

(assert (=> d!46429 (or (= (bvand lt!225490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225491 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225490 lt!225491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46429 (= lt!225491 (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6862 lt!225268)))) ((_ sign_extend 32) (currentByte!6327 (_1!6862 lt!225268))) ((_ sign_extend 32) (currentBit!6322 (_1!6862 lt!225268)))))))

(declare-fun lt!225494 () (_ BitVec 64))

(declare-fun lt!225492 () (_ BitVec 64))

(assert (=> d!46429 (= lt!225490 (bvmul lt!225494 lt!225492))))

(assert (=> d!46429 (or (= lt!225494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225492 (bvsdiv (bvmul lt!225494 lt!225492) lt!225494)))))

(assert (=> d!46429 (= lt!225492 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46429 (= lt!225494 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6862 lt!225268)))))))

(assert (=> d!46429 (= lt!225493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6327 (_1!6862 lt!225268))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6322 (_1!6862 lt!225268)))))))

(assert (=> d!46429 (invariant!0 (currentBit!6322 (_1!6862 lt!225268)) (currentByte!6327 (_1!6862 lt!225268)) (size!2998 (buf!3437 (_1!6862 lt!225268))))))

(assert (=> d!46429 (= (bitIndex!0 (size!2998 (buf!3437 (_1!6862 lt!225268))) (currentByte!6327 (_1!6862 lt!225268)) (currentBit!6322 (_1!6862 lt!225268))) lt!225493)))

(declare-fun b!145567 () Bool)

(declare-fun res!121729 () Bool)

(assert (=> b!145567 (=> (not res!121729) (not e!97058))))

(assert (=> b!145567 (= res!121729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225493))))

(declare-fun b!145568 () Bool)

(declare-fun lt!225495 () (_ BitVec 64))

(assert (=> b!145568 (= e!97058 (bvsle lt!225493 (bvmul lt!225495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145568 (or (= lt!225495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225495)))))

(assert (=> b!145568 (= lt!225495 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6862 lt!225268)))))))

(assert (= (and d!46429 res!121730) b!145567))

(assert (= (and b!145567 res!121729) b!145568))

(declare-fun m!224025 () Bool)

(assert (=> d!46429 m!224025))

(declare-fun m!224027 () Bool)

(assert (=> d!46429 m!224027))

(assert (=> b!145432 d!46429))

(declare-fun d!46431 () Bool)

(assert (=> d!46431 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!225498 () Unit!9069)

(declare-fun choose!26 (BitStream!5254 array!6620 (_ BitVec 32) BitStream!5254) Unit!9069)

(assert (=> d!46431 (= lt!225498 (choose!26 thiss!1634 (buf!3437 (_2!6859 lt!225255)) (bvsub to!404 from!447) (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634))))))

(assert (=> d!46431 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3437 (_2!6859 lt!225255)) (bvsub to!404 from!447)) lt!225498)))

(declare-fun bs!11388 () Bool)

(assert (= bs!11388 d!46431))

(assert (=> bs!11388 m!223779))

(declare-fun m!224029 () Bool)

(assert (=> bs!11388 m!224029))

(assert (=> b!145432 d!46431))

(declare-fun d!46433 () Bool)

(declare-fun lt!225499 () tuple2!13050)

(assert (=> d!46433 (= lt!225499 (readByte!0 (_1!6860 lt!225269)))))

(assert (=> d!46433 (= (readBytePure!0 (_1!6860 lt!225269)) (tuple2!13033 (_2!6871 lt!225499) (_1!6871 lt!225499)))))

(declare-fun bs!11389 () Bool)

(assert (= bs!11389 d!46433))

(declare-fun m!224031 () Bool)

(assert (=> bs!11389 m!224031))

(assert (=> b!145432 d!46433))

(declare-fun d!46435 () Bool)

(declare-fun e!97061 () Bool)

(assert (=> d!46435 e!97061))

(declare-fun res!121733 () Bool)

(assert (=> d!46435 (=> (not res!121733) (not e!97061))))

(declare-fun lt!225511 () tuple2!13032)

(declare-fun lt!225509 () tuple2!13032)

(assert (=> d!46435 (= res!121733 (= (bitIndex!0 (size!2998 (buf!3437 (_1!6862 lt!225511))) (currentByte!6327 (_1!6862 lt!225511)) (currentBit!6322 (_1!6862 lt!225511))) (bitIndex!0 (size!2998 (buf!3437 (_1!6862 lt!225509))) (currentByte!6327 (_1!6862 lt!225509)) (currentBit!6322 (_1!6862 lt!225509)))))))

(declare-fun lt!225510 () Unit!9069)

(declare-fun lt!225508 () BitStream!5254)

(declare-fun choose!14 (BitStream!5254 BitStream!5254 BitStream!5254 tuple2!13032 tuple2!13032 BitStream!5254 (_ BitVec 8) tuple2!13032 tuple2!13032 BitStream!5254 (_ BitVec 8)) Unit!9069)

(assert (=> d!46435 (= lt!225510 (choose!14 lt!225266 (_2!6859 lt!225255) lt!225508 lt!225511 (tuple2!13033 (_1!6862 lt!225511) (_2!6862 lt!225511)) (_1!6862 lt!225511) (_2!6862 lt!225511) lt!225509 (tuple2!13033 (_1!6862 lt!225509) (_2!6862 lt!225509)) (_1!6862 lt!225509) (_2!6862 lt!225509)))))

(assert (=> d!46435 (= lt!225509 (readBytePure!0 lt!225508))))

(assert (=> d!46435 (= lt!225511 (readBytePure!0 lt!225266))))

(assert (=> d!46435 (= lt!225508 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 lt!225266) (currentBit!6322 lt!225266)))))

(assert (=> d!46435 (= (readBytePrefixLemma!0 lt!225266 (_2!6859 lt!225255)) lt!225510)))

(declare-fun b!145571 () Bool)

(assert (=> b!145571 (= e!97061 (= (_2!6862 lt!225511) (_2!6862 lt!225509)))))

(assert (= (and d!46435 res!121733) b!145571))

(declare-fun m!224033 () Bool)

(assert (=> d!46435 m!224033))

(assert (=> d!46435 m!223787))

(declare-fun m!224035 () Bool)

(assert (=> d!46435 m!224035))

(declare-fun m!224037 () Bool)

(assert (=> d!46435 m!224037))

(declare-fun m!224039 () Bool)

(assert (=> d!46435 m!224039))

(assert (=> b!145432 d!46435))

(declare-fun d!46437 () Bool)

(assert (=> d!46437 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11390 () Bool)

(assert (= bs!11390 d!46437))

(declare-fun m!224041 () Bool)

(assert (=> bs!11390 m!224041))

(assert (=> b!145432 d!46437))

(declare-fun d!46439 () Bool)

(declare-fun lt!225512 () tuple2!13050)

(assert (=> d!46439 (= lt!225512 (readByte!0 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634))))))

(assert (=> d!46439 (= (readBytePure!0 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634))) (tuple2!13033 (_2!6871 lt!225512) (_1!6871 lt!225512)))))

(declare-fun bs!11391 () Bool)

(assert (= bs!11391 d!46439))

(declare-fun m!224043 () Bool)

(assert (=> bs!11391 m!224043))

(assert (=> b!145432 d!46439))

(declare-fun d!46441 () Bool)

(assert (=> d!46441 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225264) (bvsle ((_ sign_extend 32) lt!225264) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11392 () Bool)

(assert (= bs!11392 d!46441))

(assert (=> bs!11392 m!223979))

(assert (=> b!145432 d!46441))

(declare-fun d!46443 () Bool)

(assert (=> d!46443 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6860 lt!225269)))) ((_ sign_extend 32) (currentByte!6327 (_1!6860 lt!225269))) ((_ sign_extend 32) (currentBit!6322 (_1!6860 lt!225269))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6860 lt!225269)))) ((_ sign_extend 32) (currentByte!6327 (_1!6860 lt!225269))) ((_ sign_extend 32) (currentBit!6322 (_1!6860 lt!225269)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11393 () Bool)

(assert (= bs!11393 d!46443))

(declare-fun m!224045 () Bool)

(assert (=> bs!11393 m!224045))

(assert (=> b!145432 d!46443))

(declare-fun d!46447 () Bool)

(declare-fun lt!225513 () tuple2!13050)

(assert (=> d!46447 (= lt!225513 (readByte!0 lt!225266))))

(assert (=> d!46447 (= (readBytePure!0 lt!225266) (tuple2!13033 (_2!6871 lt!225513) (_1!6871 lt!225513)))))

(declare-fun bs!11394 () Bool)

(assert (= bs!11394 d!46447))

(declare-fun m!224047 () Bool)

(assert (=> bs!11394 m!224047))

(assert (=> b!145432 d!46447))

(declare-fun d!46449 () Bool)

(assert (=> d!46449 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225264)))

(declare-fun lt!225514 () Unit!9069)

(assert (=> d!46449 (= lt!225514 (choose!26 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225255)) lt!225264 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259)))))))

(assert (=> d!46449 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225255)) lt!225264) lt!225514)))

(declare-fun bs!11395 () Bool)

(assert (= bs!11395 d!46449))

(assert (=> bs!11395 m!223769))

(declare-fun m!224049 () Bool)

(assert (=> bs!11395 m!224049))

(assert (=> b!145432 d!46449))

(declare-fun b!145616 () Bool)

(declare-fun e!97090 () Bool)

(declare-fun lt!225623 () (_ BitVec 64))

(assert (=> b!145616 (= e!97090 (validate_offset_bits!1 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225623))))

(declare-fun b!145617 () Bool)

(declare-fun e!97089 () Bool)

(declare-fun e!97088 () Bool)

(assert (=> b!145617 (= e!97089 e!97088)))

(declare-fun res!121774 () Bool)

(assert (=> b!145617 (=> (not res!121774) (not e!97088))))

(declare-fun lt!225617 () tuple2!13028)

(declare-fun lt!225622 () tuple2!13030)

(assert (=> b!145617 (= res!121774 (and (= (size!2998 (_2!6861 lt!225622)) (size!2998 arr!237)) (= (_1!6861 lt!225622) (_2!6860 lt!225617))))))

(assert (=> b!145617 (= lt!225622 (readByteArrayLoopPure!0 (_1!6860 lt!225617) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225619 () Unit!9069)

(declare-fun lt!225616 () Unit!9069)

(assert (=> b!145617 (= lt!225619 lt!225616)))

(declare-fun lt!225621 () tuple2!13026)

(assert (=> b!145617 (validate_offset_bits!1 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225621)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225623)))

(assert (=> b!145617 (= lt!225616 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225621)) lt!225623))))

(assert (=> b!145617 e!97090))

(declare-fun res!121775 () Bool)

(assert (=> b!145617 (=> (not res!121775) (not e!97090))))

(assert (=> b!145617 (= res!121775 (and (= (size!2998 (buf!3437 (_2!6859 lt!225259))) (size!2998 (buf!3437 (_2!6859 lt!225621)))) (bvsge lt!225623 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145617 (= lt!225623 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!145617 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!145617 (= lt!225617 (reader!0 (_2!6859 lt!225259) (_2!6859 lt!225621)))))

(declare-fun b!145618 () Bool)

(assert (=> b!145618 (= e!97088 (arrayRangesEq!314 arr!237 (_2!6861 lt!225622) #b00000000000000000000000000000000 to!404))))

(declare-fun d!46451 () Bool)

(assert (=> d!46451 e!97089))

(declare-fun res!121776 () Bool)

(assert (=> d!46451 (=> (not res!121776) (not e!97089))))

(assert (=> d!46451 (= res!121776 (= (size!2998 (buf!3437 (_2!6859 lt!225259))) (size!2998 (buf!3437 (_2!6859 lt!225621)))))))

(declare-fun choose!64 (BitStream!5254 array!6620 (_ BitVec 32) (_ BitVec 32)) tuple2!13026)

(assert (=> d!46451 (= lt!225621 (choose!64 (_2!6859 lt!225259) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46451 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2998 arr!237)))))

(assert (=> d!46451 (= (appendByteArrayLoop!0 (_2!6859 lt!225259) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!225621)))

(declare-fun b!145619 () Bool)

(declare-fun res!121772 () Bool)

(assert (=> b!145619 (=> (not res!121772) (not e!97089))))

(assert (=> b!145619 (= res!121772 (isPrefixOf!0 (_2!6859 lt!225259) (_2!6859 lt!225621)))))

(declare-fun b!145620 () Bool)

(declare-fun res!121773 () Bool)

(assert (=> b!145620 (=> (not res!121773) (not e!97089))))

(declare-fun lt!225618 () (_ BitVec 64))

(declare-fun lt!225620 () (_ BitVec 64))

(assert (=> b!145620 (= res!121773 (= (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225621))) (currentByte!6327 (_2!6859 lt!225621)) (currentBit!6322 (_2!6859 lt!225621))) (bvadd lt!225620 lt!225618)))))

(assert (=> b!145620 (or (not (= (bvand lt!225620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225618 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!225620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!225620 lt!225618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!225624 () (_ BitVec 64))

(assert (=> b!145620 (= lt!225618 (bvmul lt!225624 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!145620 (or (= lt!225624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225624)))))

(assert (=> b!145620 (= lt!225624 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!145620 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!145620 (= lt!225620 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))))))

(assert (= (and d!46451 res!121776) b!145620))

(assert (= (and b!145620 res!121773) b!145619))

(assert (= (and b!145619 res!121772) b!145617))

(assert (= (and b!145617 res!121775) b!145616))

(assert (= (and b!145617 res!121774) b!145618))

(declare-fun m!224107 () Bool)

(assert (=> d!46451 m!224107))

(declare-fun m!224109 () Bool)

(assert (=> b!145617 m!224109))

(declare-fun m!224113 () Bool)

(assert (=> b!145617 m!224113))

(declare-fun m!224115 () Bool)

(assert (=> b!145617 m!224115))

(declare-fun m!224117 () Bool)

(assert (=> b!145617 m!224117))

(declare-fun m!224119 () Bool)

(assert (=> b!145620 m!224119))

(assert (=> b!145620 m!223809))

(declare-fun m!224121 () Bool)

(assert (=> b!145618 m!224121))

(declare-fun m!224123 () Bool)

(assert (=> b!145619 m!224123))

(declare-fun m!224125 () Bool)

(assert (=> b!145616 m!224125))

(assert (=> b!145432 d!46451))

(declare-fun d!46483 () Bool)

(declare-fun e!97097 () Bool)

(assert (=> d!46483 e!97097))

(declare-fun res!121786 () Bool)

(assert (=> d!46483 (=> (not res!121786) (not e!97097))))

(assert (=> d!46483 (= res!121786 (and (or (let ((rhs!3217 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3217 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3217) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46490 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46490 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46490 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3216 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3216 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3216) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!225669 () Unit!9069)

(declare-fun choose!57 (BitStream!5254 BitStream!5254 (_ BitVec 64) (_ BitVec 32)) Unit!9069)

(assert (=> d!46483 (= lt!225669 (choose!57 thiss!1634 (_2!6859 lt!225259) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46483 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6859 lt!225259) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!225669)))

(declare-fun lt!225668 () (_ BitVec 32))

(declare-fun b!145632 () Bool)

(assert (=> b!145632 (= e!97097 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225259)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) (bvsub (bvsub to!404 from!447) lt!225668)))))

(assert (=> b!145632 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!225668 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!225668) #b10000000000000000000000000000000)))))

(declare-fun lt!225667 () (_ BitVec 64))

(assert (=> b!145632 (= lt!225668 ((_ extract 31 0) lt!225667))))

(assert (=> b!145632 (and (bvslt lt!225667 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!225667 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!145632 (= lt!225667 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46483 res!121786) b!145632))

(declare-fun m!224163 () Bool)

(assert (=> d!46483 m!224163))

(declare-fun m!224165 () Bool)

(assert (=> b!145632 m!224165))

(assert (=> b!145432 d!46483))

(declare-fun d!46497 () Bool)

(declare-fun e!97098 () Bool)

(assert (=> d!46497 e!97098))

(declare-fun res!121787 () Bool)

(assert (=> d!46497 (=> (not res!121787) (not e!97098))))

(declare-fun lt!225673 () tuple2!13028)

(assert (=> d!46497 (= res!121787 (isPrefixOf!0 (_1!6860 lt!225673) (_2!6860 lt!225673)))))

(declare-fun lt!225686 () BitStream!5254)

(assert (=> d!46497 (= lt!225673 (tuple2!13029 lt!225686 (_2!6859 lt!225255)))))

(declare-fun lt!225672 () Unit!9069)

(declare-fun lt!225675 () Unit!9069)

(assert (=> d!46497 (= lt!225672 lt!225675)))

(assert (=> d!46497 (isPrefixOf!0 lt!225686 (_2!6859 lt!225255))))

(assert (=> d!46497 (= lt!225675 (lemmaIsPrefixTransitive!0 lt!225686 (_2!6859 lt!225255) (_2!6859 lt!225255)))))

(declare-fun lt!225681 () Unit!9069)

(declare-fun lt!225670 () Unit!9069)

(assert (=> d!46497 (= lt!225681 lt!225670)))

(assert (=> d!46497 (isPrefixOf!0 lt!225686 (_2!6859 lt!225255))))

(assert (=> d!46497 (= lt!225670 (lemmaIsPrefixTransitive!0 lt!225686 thiss!1634 (_2!6859 lt!225255)))))

(declare-fun lt!225678 () Unit!9069)

(declare-fun e!97099 () Unit!9069)

(assert (=> d!46497 (= lt!225678 e!97099)))

(declare-fun c!7893 () Bool)

(assert (=> d!46497 (= c!7893 (not (= (size!2998 (buf!3437 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!225684 () Unit!9069)

(declare-fun lt!225689 () Unit!9069)

(assert (=> d!46497 (= lt!225684 lt!225689)))

(assert (=> d!46497 (isPrefixOf!0 (_2!6859 lt!225255) (_2!6859 lt!225255))))

(assert (=> d!46497 (= lt!225689 (lemmaIsPrefixRefl!0 (_2!6859 lt!225255)))))

(declare-fun lt!225688 () Unit!9069)

(declare-fun lt!225682 () Unit!9069)

(assert (=> d!46497 (= lt!225688 lt!225682)))

(assert (=> d!46497 (= lt!225682 (lemmaIsPrefixRefl!0 (_2!6859 lt!225255)))))

(declare-fun lt!225685 () Unit!9069)

(declare-fun lt!225671 () Unit!9069)

(assert (=> d!46497 (= lt!225685 lt!225671)))

(assert (=> d!46497 (isPrefixOf!0 lt!225686 lt!225686)))

(assert (=> d!46497 (= lt!225671 (lemmaIsPrefixRefl!0 lt!225686))))

(declare-fun lt!225677 () Unit!9069)

(declare-fun lt!225680 () Unit!9069)

(assert (=> d!46497 (= lt!225677 lt!225680)))

(assert (=> d!46497 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46497 (= lt!225680 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46497 (= lt!225686 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(assert (=> d!46497 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225255))))

(assert (=> d!46497 (= (reader!0 thiss!1634 (_2!6859 lt!225255)) lt!225673)))

(declare-fun b!145633 () Bool)

(declare-fun res!121788 () Bool)

(assert (=> b!145633 (=> (not res!121788) (not e!97098))))

(assert (=> b!145633 (= res!121788 (isPrefixOf!0 (_1!6860 lt!225673) thiss!1634))))

(declare-fun lt!225679 () (_ BitVec 64))

(declare-fun lt!225674 () (_ BitVec 64))

(declare-fun b!145634 () Bool)

(assert (=> b!145634 (= e!97098 (= (_1!6860 lt!225673) (withMovedBitIndex!0 (_2!6860 lt!225673) (bvsub lt!225679 lt!225674))))))

(assert (=> b!145634 (or (= (bvand lt!225679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225674 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225679 lt!225674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145634 (= lt!225674 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225255))) (currentByte!6327 (_2!6859 lt!225255)) (currentBit!6322 (_2!6859 lt!225255))))))

(assert (=> b!145634 (= lt!225679 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(declare-fun b!145635 () Bool)

(declare-fun Unit!9077 () Unit!9069)

(assert (=> b!145635 (= e!97099 Unit!9077)))

(declare-fun b!145636 () Bool)

(declare-fun lt!225676 () Unit!9069)

(assert (=> b!145636 (= e!97099 lt!225676)))

(declare-fun lt!225683 () (_ BitVec 64))

(assert (=> b!145636 (= lt!225683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225687 () (_ BitVec 64))

(assert (=> b!145636 (= lt!225687 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(assert (=> b!145636 (= lt!225676 (arrayBitRangesEqSymmetric!0 (buf!3437 thiss!1634) (buf!3437 (_2!6859 lt!225255)) lt!225683 lt!225687))))

(assert (=> b!145636 (arrayBitRangesEq!0 (buf!3437 (_2!6859 lt!225255)) (buf!3437 thiss!1634) lt!225683 lt!225687)))

(declare-fun b!145637 () Bool)

(declare-fun res!121789 () Bool)

(assert (=> b!145637 (=> (not res!121789) (not e!97098))))

(assert (=> b!145637 (= res!121789 (isPrefixOf!0 (_2!6860 lt!225673) (_2!6859 lt!225255)))))

(assert (= (and d!46497 c!7893) b!145636))

(assert (= (and d!46497 (not c!7893)) b!145635))

(assert (= (and d!46497 res!121787) b!145633))

(assert (= (and b!145633 res!121788) b!145637))

(assert (= (and b!145637 res!121789) b!145634))

(declare-fun m!224167 () Bool)

(assert (=> b!145633 m!224167))

(declare-fun m!224169 () Bool)

(assert (=> d!46497 m!224169))

(assert (=> d!46497 m!223991))

(declare-fun m!224171 () Bool)

(assert (=> d!46497 m!224171))

(declare-fun m!224173 () Bool)

(assert (=> d!46497 m!224173))

(assert (=> d!46497 m!223997))

(declare-fun m!224175 () Bool)

(assert (=> d!46497 m!224175))

(declare-fun m!224177 () Bool)

(assert (=> d!46497 m!224177))

(assert (=> d!46497 m!223747))

(declare-fun m!224179 () Bool)

(assert (=> d!46497 m!224179))

(declare-fun m!224181 () Bool)

(assert (=> d!46497 m!224181))

(declare-fun m!224183 () Bool)

(assert (=> d!46497 m!224183))

(declare-fun m!224185 () Bool)

(assert (=> b!145637 m!224185))

(declare-fun m!224187 () Bool)

(assert (=> b!145634 m!224187))

(assert (=> b!145634 m!223807))

(assert (=> b!145634 m!223811))

(assert (=> b!145636 m!223811))

(declare-fun m!224189 () Bool)

(assert (=> b!145636 m!224189))

(declare-fun m!224191 () Bool)

(assert (=> b!145636 m!224191))

(assert (=> b!145432 d!46497))

(declare-fun d!46499 () Bool)

(declare-fun e!97102 () Bool)

(assert (=> d!46499 e!97102))

(declare-fun res!121792 () Bool)

(assert (=> d!46499 (=> (not res!121792) (not e!97102))))

(declare-fun lt!225699 () tuple2!13028)

(assert (=> d!46499 (= res!121792 (isPrefixOf!0 (_1!6860 lt!225699) (_2!6860 lt!225699)))))

(declare-fun lt!225712 () BitStream!5254)

(assert (=> d!46499 (= lt!225699 (tuple2!13029 lt!225712 (_2!6859 lt!225255)))))

(declare-fun lt!225698 () Unit!9069)

(declare-fun lt!225701 () Unit!9069)

(assert (=> d!46499 (= lt!225698 lt!225701)))

(assert (=> d!46499 (isPrefixOf!0 lt!225712 (_2!6859 lt!225255))))

(assert (=> d!46499 (= lt!225701 (lemmaIsPrefixTransitive!0 lt!225712 (_2!6859 lt!225255) (_2!6859 lt!225255)))))

(declare-fun lt!225707 () Unit!9069)

(declare-fun lt!225696 () Unit!9069)

(assert (=> d!46499 (= lt!225707 lt!225696)))

(assert (=> d!46499 (isPrefixOf!0 lt!225712 (_2!6859 lt!225255))))

(assert (=> d!46499 (= lt!225696 (lemmaIsPrefixTransitive!0 lt!225712 (_2!6859 lt!225259) (_2!6859 lt!225255)))))

(declare-fun lt!225704 () Unit!9069)

(declare-fun e!97103 () Unit!9069)

(assert (=> d!46499 (= lt!225704 e!97103)))

(declare-fun c!7894 () Bool)

(assert (=> d!46499 (= c!7894 (not (= (size!2998 (buf!3437 (_2!6859 lt!225259))) #b00000000000000000000000000000000)))))

(declare-fun lt!225710 () Unit!9069)

(declare-fun lt!225715 () Unit!9069)

(assert (=> d!46499 (= lt!225710 lt!225715)))

(assert (=> d!46499 (isPrefixOf!0 (_2!6859 lt!225255) (_2!6859 lt!225255))))

(assert (=> d!46499 (= lt!225715 (lemmaIsPrefixRefl!0 (_2!6859 lt!225255)))))

(declare-fun lt!225714 () Unit!9069)

(declare-fun lt!225708 () Unit!9069)

(assert (=> d!46499 (= lt!225714 lt!225708)))

(assert (=> d!46499 (= lt!225708 (lemmaIsPrefixRefl!0 (_2!6859 lt!225255)))))

(declare-fun lt!225711 () Unit!9069)

(declare-fun lt!225697 () Unit!9069)

(assert (=> d!46499 (= lt!225711 lt!225697)))

(assert (=> d!46499 (isPrefixOf!0 lt!225712 lt!225712)))

(assert (=> d!46499 (= lt!225697 (lemmaIsPrefixRefl!0 lt!225712))))

(declare-fun lt!225703 () Unit!9069)

(declare-fun lt!225706 () Unit!9069)

(assert (=> d!46499 (= lt!225703 lt!225706)))

(assert (=> d!46499 (isPrefixOf!0 (_2!6859 lt!225259) (_2!6859 lt!225259))))

(assert (=> d!46499 (= lt!225706 (lemmaIsPrefixRefl!0 (_2!6859 lt!225259)))))

(assert (=> d!46499 (= lt!225712 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))))))

(assert (=> d!46499 (isPrefixOf!0 (_2!6859 lt!225259) (_2!6859 lt!225255))))

(assert (=> d!46499 (= (reader!0 (_2!6859 lt!225259) (_2!6859 lt!225255)) lt!225699)))

(declare-fun b!145640 () Bool)

(declare-fun res!121793 () Bool)

(assert (=> b!145640 (=> (not res!121793) (not e!97102))))

(assert (=> b!145640 (= res!121793 (isPrefixOf!0 (_1!6860 lt!225699) (_2!6859 lt!225259)))))

(declare-fun lt!225700 () (_ BitVec 64))

(declare-fun b!145641 () Bool)

(declare-fun lt!225705 () (_ BitVec 64))

(assert (=> b!145641 (= e!97102 (= (_1!6860 lt!225699) (withMovedBitIndex!0 (_2!6860 lt!225699) (bvsub lt!225705 lt!225700))))))

(assert (=> b!145641 (or (= (bvand lt!225705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225705 lt!225700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145641 (= lt!225700 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225255))) (currentByte!6327 (_2!6859 lt!225255)) (currentBit!6322 (_2!6859 lt!225255))))))

(assert (=> b!145641 (= lt!225705 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))))))

(declare-fun b!145642 () Bool)

(declare-fun Unit!9078 () Unit!9069)

(assert (=> b!145642 (= e!97103 Unit!9078)))

(declare-fun b!145643 () Bool)

(declare-fun lt!225702 () Unit!9069)

(assert (=> b!145643 (= e!97103 lt!225702)))

(declare-fun lt!225709 () (_ BitVec 64))

(assert (=> b!145643 (= lt!225709 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!225713 () (_ BitVec 64))

(assert (=> b!145643 (= lt!225713 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))))))

(assert (=> b!145643 (= lt!225702 (arrayBitRangesEqSymmetric!0 (buf!3437 (_2!6859 lt!225259)) (buf!3437 (_2!6859 lt!225255)) lt!225709 lt!225713))))

(assert (=> b!145643 (arrayBitRangesEq!0 (buf!3437 (_2!6859 lt!225255)) (buf!3437 (_2!6859 lt!225259)) lt!225709 lt!225713)))

(declare-fun b!145644 () Bool)

(declare-fun res!121794 () Bool)

(assert (=> b!145644 (=> (not res!121794) (not e!97102))))

(assert (=> b!145644 (= res!121794 (isPrefixOf!0 (_2!6860 lt!225699) (_2!6859 lt!225255)))))

(assert (= (and d!46499 c!7894) b!145643))

(assert (= (and d!46499 (not c!7894)) b!145642))

(assert (= (and d!46499 res!121792) b!145640))

(assert (= (and b!145640 res!121793) b!145644))

(assert (= (and b!145644 res!121794) b!145641))

(declare-fun m!224197 () Bool)

(assert (=> b!145640 m!224197))

(declare-fun m!224199 () Bool)

(assert (=> d!46499 m!224199))

(assert (=> d!46499 m!224003))

(declare-fun m!224203 () Bool)

(assert (=> d!46499 m!224203))

(declare-fun m!224205 () Bool)

(assert (=> d!46499 m!224205))

(assert (=> d!46499 m!224005))

(declare-fun m!224207 () Bool)

(assert (=> d!46499 m!224207))

(declare-fun m!224209 () Bool)

(assert (=> d!46499 m!224209))

(assert (=> d!46499 m!223739))

(assert (=> d!46499 m!224179))

(assert (=> d!46499 m!224181))

(declare-fun m!224213 () Bool)

(assert (=> d!46499 m!224213))

(declare-fun m!224215 () Bool)

(assert (=> b!145644 m!224215))

(declare-fun m!224217 () Bool)

(assert (=> b!145641 m!224217))

(assert (=> b!145641 m!223807))

(assert (=> b!145641 m!223809))

(assert (=> b!145643 m!223809))

(declare-fun m!224219 () Bool)

(assert (=> b!145643 m!224219))

(declare-fun m!224221 () Bool)

(assert (=> b!145643 m!224221))

(assert (=> b!145432 d!46499))

(declare-fun d!46507 () Bool)

(declare-fun res!121797 () Bool)

(declare-fun e!97105 () Bool)

(assert (=> d!46507 (=> (not res!121797) (not e!97105))))

(assert (=> d!46507 (= res!121797 (= (size!2998 (buf!3437 thiss!1634)) (size!2998 (buf!3437 (_2!6859 lt!225255)))))))

(assert (=> d!46507 (= (isPrefixOf!0 thiss!1634 (_2!6859 lt!225255)) e!97105)))

(declare-fun b!145646 () Bool)

(declare-fun res!121798 () Bool)

(assert (=> b!145646 (=> (not res!121798) (not e!97105))))

(assert (=> b!145646 (= res!121798 (bvsle (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)) (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225255))) (currentByte!6327 (_2!6859 lt!225255)) (currentBit!6322 (_2!6859 lt!225255)))))))

(declare-fun b!145647 () Bool)

(declare-fun e!97106 () Bool)

(assert (=> b!145647 (= e!97105 e!97106)))

(declare-fun res!121796 () Bool)

(assert (=> b!145647 (=> res!121796 e!97106)))

(assert (=> b!145647 (= res!121796 (= (size!2998 (buf!3437 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!145648 () Bool)

(assert (=> b!145648 (= e!97106 (arrayBitRangesEq!0 (buf!3437 thiss!1634) (buf!3437 (_2!6859 lt!225255)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634))))))

(assert (= (and d!46507 res!121797) b!145646))

(assert (= (and b!145646 res!121798) b!145647))

(assert (= (and b!145647 (not res!121796)) b!145648))

(assert (=> b!145646 m!223811))

(assert (=> b!145646 m!223807))

(assert (=> b!145648 m!223811))

(assert (=> b!145648 m!223811))

(declare-fun m!224223 () Bool)

(assert (=> b!145648 m!224223))

(assert (=> b!145432 d!46507))

(declare-fun d!46509 () Bool)

(declare-fun e!97107 () Bool)

(assert (=> d!46509 e!97107))

(declare-fun res!121800 () Bool)

(assert (=> d!46509 (=> (not res!121800) (not e!97107))))

(declare-fun lt!225721 () (_ BitVec 64))

(declare-fun lt!225723 () (_ BitVec 64))

(declare-fun lt!225720 () (_ BitVec 64))

(assert (=> d!46509 (= res!121800 (= lt!225723 (bvsub lt!225720 lt!225721)))))

(assert (=> d!46509 (or (= (bvand lt!225720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225721 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225720 lt!225721) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46509 (= lt!225721 (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6862 lt!225257)))) ((_ sign_extend 32) (currentByte!6327 (_1!6862 lt!225257))) ((_ sign_extend 32) (currentBit!6322 (_1!6862 lt!225257)))))))

(declare-fun lt!225724 () (_ BitVec 64))

(declare-fun lt!225722 () (_ BitVec 64))

(assert (=> d!46509 (= lt!225720 (bvmul lt!225724 lt!225722))))

(assert (=> d!46509 (or (= lt!225724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225722 (bvsdiv (bvmul lt!225724 lt!225722) lt!225724)))))

(assert (=> d!46509 (= lt!225722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46509 (= lt!225724 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6862 lt!225257)))))))

(assert (=> d!46509 (= lt!225723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6327 (_1!6862 lt!225257))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6322 (_1!6862 lt!225257)))))))

(assert (=> d!46509 (invariant!0 (currentBit!6322 (_1!6862 lt!225257)) (currentByte!6327 (_1!6862 lt!225257)) (size!2998 (buf!3437 (_1!6862 lt!225257))))))

(assert (=> d!46509 (= (bitIndex!0 (size!2998 (buf!3437 (_1!6862 lt!225257))) (currentByte!6327 (_1!6862 lt!225257)) (currentBit!6322 (_1!6862 lt!225257))) lt!225723)))

(declare-fun b!145649 () Bool)

(declare-fun res!121799 () Bool)

(assert (=> b!145649 (=> (not res!121799) (not e!97107))))

(assert (=> b!145649 (= res!121799 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225723))))

(declare-fun b!145650 () Bool)

(declare-fun lt!225725 () (_ BitVec 64))

(assert (=> b!145650 (= e!97107 (bvsle lt!225723 (bvmul lt!225725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145650 (or (= lt!225725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225725)))))

(assert (=> b!145650 (= lt!225725 ((_ sign_extend 32) (size!2998 (buf!3437 (_1!6862 lt!225257)))))))

(assert (= (and d!46509 res!121800) b!145649))

(assert (= (and b!145649 res!121799) b!145650))

(declare-fun m!224225 () Bool)

(assert (=> d!46509 m!224225))

(declare-fun m!224227 () Bool)

(assert (=> d!46509 m!224227))

(assert (=> b!145432 d!46509))

(declare-fun d!46511 () Bool)

(declare-fun e!97113 () Bool)

(assert (=> d!46511 e!97113))

(declare-fun res!121811 () Bool)

(assert (=> d!46511 (=> (not res!121811) (not e!97113))))

(declare-fun lt!225754 () tuple2!13026)

(assert (=> d!46511 (= res!121811 (= (size!2998 (buf!3437 thiss!1634)) (size!2998 (buf!3437 (_2!6859 lt!225754)))))))

(declare-fun choose!6 (BitStream!5254 (_ BitVec 8)) tuple2!13026)

(assert (=> d!46511 (= lt!225754 (choose!6 thiss!1634 (select (arr!3731 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46511 (validate_offset_byte!0 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634)))))

(assert (=> d!46511 (= (appendByte!0 thiss!1634 (select (arr!3731 arr!237) from!447)) lt!225754)))

(declare-fun b!145660 () Bool)

(declare-fun res!121812 () Bool)

(assert (=> b!145660 (=> (not res!121812) (not e!97113))))

(declare-fun lt!225753 () (_ BitVec 64))

(declare-fun lt!225750 () (_ BitVec 64))

(assert (=> b!145660 (= res!121812 (= (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225754))) (currentByte!6327 (_2!6859 lt!225754)) (currentBit!6322 (_2!6859 lt!225754))) (bvadd lt!225750 lt!225753)))))

(assert (=> b!145660 (or (not (= (bvand lt!225750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225753 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!225750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!225750 lt!225753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145660 (= lt!225753 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!145660 (= lt!225750 (bitIndex!0 (size!2998 (buf!3437 thiss!1634)) (currentByte!6327 thiss!1634) (currentBit!6322 thiss!1634)))))

(declare-fun b!145661 () Bool)

(declare-fun res!121810 () Bool)

(assert (=> b!145661 (=> (not res!121810) (not e!97113))))

(assert (=> b!145661 (= res!121810 (isPrefixOf!0 thiss!1634 (_2!6859 lt!225754)))))

(declare-fun lt!225749 () tuple2!13028)

(declare-fun lt!225748 () tuple2!13032)

(declare-fun b!145662 () Bool)

(assert (=> b!145662 (= e!97113 (and (= (_2!6862 lt!225748) (select (arr!3731 arr!237) from!447)) (= (_1!6862 lt!225748) (_2!6860 lt!225749))))))

(assert (=> b!145662 (= lt!225748 (readBytePure!0 (_1!6860 lt!225749)))))

(assert (=> b!145662 (= lt!225749 (reader!0 thiss!1634 (_2!6859 lt!225754)))))

(assert (= (and d!46511 res!121811) b!145660))

(assert (= (and b!145660 res!121812) b!145661))

(assert (= (and b!145661 res!121810) b!145662))

(assert (=> d!46511 m!223763))

(declare-fun m!224237 () Bool)

(assert (=> d!46511 m!224237))

(declare-fun m!224239 () Bool)

(assert (=> d!46511 m!224239))

(declare-fun m!224241 () Bool)

(assert (=> b!145660 m!224241))

(assert (=> b!145660 m!223811))

(declare-fun m!224243 () Bool)

(assert (=> b!145661 m!224243))

(declare-fun m!224245 () Bool)

(assert (=> b!145662 m!224245))

(declare-fun m!224247 () Bool)

(assert (=> b!145662 m!224247))

(assert (=> b!145432 d!46511))

(declare-fun d!46515 () Bool)

(declare-fun res!121820 () Bool)

(declare-fun e!97116 () Bool)

(assert (=> d!46515 (=> (not res!121820) (not e!97116))))

(assert (=> d!46515 (= res!121820 (= (size!2998 (buf!3437 (_2!6859 lt!225259))) (size!2998 (buf!3437 (_2!6859 lt!225255)))))))

(assert (=> d!46515 (= (isPrefixOf!0 (_2!6859 lt!225259) (_2!6859 lt!225255)) e!97116)))

(declare-fun b!145669 () Bool)

(declare-fun res!121821 () Bool)

(assert (=> b!145669 (=> (not res!121821) (not e!97116))))

(assert (=> b!145669 (= res!121821 (bvsle (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259))) (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225255))) (currentByte!6327 (_2!6859 lt!225255)) (currentBit!6322 (_2!6859 lt!225255)))))))

(declare-fun b!145670 () Bool)

(declare-fun e!97117 () Bool)

(assert (=> b!145670 (= e!97116 e!97117)))

(declare-fun res!121819 () Bool)

(assert (=> b!145670 (=> res!121819 e!97117)))

(assert (=> b!145670 (= res!121819 (= (size!2998 (buf!3437 (_2!6859 lt!225259))) #b00000000000000000000000000000000))))

(declare-fun b!145671 () Bool)

(assert (=> b!145671 (= e!97117 (arrayBitRangesEq!0 (buf!3437 (_2!6859 lt!225259)) (buf!3437 (_2!6859 lt!225255)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225259))) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259)))))))

(assert (= (and d!46515 res!121820) b!145669))

(assert (= (and b!145669 res!121821) b!145670))

(assert (= (and b!145670 (not res!121819)) b!145671))

(assert (=> b!145669 m!223809))

(assert (=> b!145669 m!223807))

(assert (=> b!145671 m!223809))

(assert (=> b!145671 m!223809))

(declare-fun m!224249 () Bool)

(assert (=> b!145671 m!224249))

(assert (=> b!145433 d!46515))

(declare-fun d!46517 () Bool)

(assert (=> d!46517 (= (array_inv!2787 arr!237) (bvsge (size!2998 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28028 d!46517))

(declare-fun d!46519 () Bool)

(assert (=> d!46519 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6322 thiss!1634) (currentByte!6327 thiss!1634) (size!2998 (buf!3437 thiss!1634))))))

(declare-fun bs!11410 () Bool)

(assert (= bs!11410 d!46519))

(assert (=> bs!11410 m!223741))

(assert (=> start!28028 d!46519))

(declare-fun lt!225768 () tuple3!558)

(declare-fun d!46521 () Bool)

(assert (=> d!46521 (= lt!225768 (readByteArrayLoop!0 (_1!6860 lt!225265) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46521 (= (readByteArrayLoopPure!0 (_1!6860 lt!225265) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13031 (_2!6872 lt!225768) (_3!346 lt!225768)))))

(declare-fun bs!11411 () Bool)

(assert (= bs!11411 d!46521))

(declare-fun m!224251 () Bool)

(assert (=> bs!11411 m!224251))

(assert (=> b!145431 d!46521))

(declare-fun d!46523 () Bool)

(assert (=> d!46523 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225263) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259)))) lt!225263))))

(declare-fun bs!11412 () Bool)

(assert (= bs!11412 d!46523))

(assert (=> bs!11412 m!224019))

(assert (=> b!145431 d!46523))

(declare-fun d!46527 () Bool)

(assert (=> d!46527 (validate_offset_bits!1 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225259))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225259))) lt!225263)))

(declare-fun lt!225774 () Unit!9069)

(declare-fun choose!9 (BitStream!5254 array!6620 (_ BitVec 64) BitStream!5254) Unit!9069)

(assert (=> d!46527 (= lt!225774 (choose!9 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225255)) lt!225263 (BitStream!5255 (buf!3437 (_2!6859 lt!225255)) (currentByte!6327 (_2!6859 lt!225259)) (currentBit!6322 (_2!6859 lt!225259)))))))

(assert (=> d!46527 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6859 lt!225259) (buf!3437 (_2!6859 lt!225255)) lt!225263) lt!225774)))

(declare-fun bs!11414 () Bool)

(assert (= bs!11414 d!46527))

(assert (=> bs!11414 m!223793))

(declare-fun m!224267 () Bool)

(assert (=> bs!11414 m!224267))

(assert (=> b!145431 d!46527))

(assert (=> b!145431 d!46499))

(declare-fun d!46531 () Bool)

(assert (=> d!46531 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 thiss!1634))) ((_ sign_extend 32) (currentByte!6327 thiss!1634)) ((_ sign_extend 32) (currentBit!6322 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11415 () Bool)

(assert (= bs!11415 d!46531))

(assert (=> bs!11415 m!223983))

(assert (=> b!145442 d!46531))

(declare-fun d!46533 () Bool)

(declare-fun res!121829 () Bool)

(declare-fun e!97123 () Bool)

(assert (=> d!46533 (=> res!121829 e!97123)))

(assert (=> d!46533 (= res!121829 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46533 (= (arrayRangesEq!314 arr!237 (_2!6861 lt!225262) #b00000000000000000000000000000000 to!404) e!97123)))

(declare-fun b!145679 () Bool)

(declare-fun e!97124 () Bool)

(assert (=> b!145679 (= e!97123 e!97124)))

(declare-fun res!121830 () Bool)

(assert (=> b!145679 (=> (not res!121830) (not e!97124))))

(assert (=> b!145679 (= res!121830 (= (select (arr!3731 arr!237) #b00000000000000000000000000000000) (select (arr!3731 (_2!6861 lt!225262)) #b00000000000000000000000000000000)))))

(declare-fun b!145680 () Bool)

(assert (=> b!145680 (= e!97124 (arrayRangesEq!314 arr!237 (_2!6861 lt!225262) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46533 (not res!121829)) b!145679))

(assert (= (and b!145679 res!121830) b!145680))

(declare-fun m!224269 () Bool)

(assert (=> b!145679 m!224269))

(declare-fun m!224271 () Bool)

(assert (=> b!145679 m!224271))

(declare-fun m!224273 () Bool)

(assert (=> b!145680 m!224273))

(assert (=> b!145440 d!46533))

(declare-fun d!46535 () Bool)

(assert (=> d!46535 (= (invariant!0 (currentBit!6322 thiss!1634) (currentByte!6327 thiss!1634) (size!2998 (buf!3437 (_2!6859 lt!225259)))) (and (bvsge (currentBit!6322 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6322 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6327 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6327 thiss!1634) (size!2998 (buf!3437 (_2!6859 lt!225259)))) (and (= (currentBit!6322 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6327 thiss!1634) (size!2998 (buf!3437 (_2!6859 lt!225259))))))))))

(assert (=> b!145430 d!46535))

(declare-fun d!46537 () Bool)

(declare-fun e!97125 () Bool)

(assert (=> d!46537 e!97125))

(declare-fun res!121832 () Bool)

(assert (=> d!46537 (=> (not res!121832) (not e!97125))))

(declare-fun lt!225776 () (_ BitVec 64))

(declare-fun lt!225775 () (_ BitVec 64))

(declare-fun lt!225778 () (_ BitVec 64))

(assert (=> d!46537 (= res!121832 (= lt!225778 (bvsub lt!225775 lt!225776)))))

(assert (=> d!46537 (or (= (bvand lt!225775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!225776 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!225775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!225775 lt!225776) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46537 (= lt!225776 (remainingBits!0 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))) ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225255))) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225255)))))))

(declare-fun lt!225779 () (_ BitVec 64))

(declare-fun lt!225777 () (_ BitVec 64))

(assert (=> d!46537 (= lt!225775 (bvmul lt!225779 lt!225777))))

(assert (=> d!46537 (or (= lt!225779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!225777 (bvsdiv (bvmul lt!225779 lt!225777) lt!225779)))))

(assert (=> d!46537 (= lt!225777 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46537 (= lt!225779 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))))))

(assert (=> d!46537 (= lt!225778 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6327 (_2!6859 lt!225255))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6322 (_2!6859 lt!225255)))))))

(assert (=> d!46537 (invariant!0 (currentBit!6322 (_2!6859 lt!225255)) (currentByte!6327 (_2!6859 lt!225255)) (size!2998 (buf!3437 (_2!6859 lt!225255))))))

(assert (=> d!46537 (= (bitIndex!0 (size!2998 (buf!3437 (_2!6859 lt!225255))) (currentByte!6327 (_2!6859 lt!225255)) (currentBit!6322 (_2!6859 lt!225255))) lt!225778)))

(declare-fun b!145681 () Bool)

(declare-fun res!121831 () Bool)

(assert (=> b!145681 (=> (not res!121831) (not e!97125))))

(assert (=> b!145681 (= res!121831 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!225778))))

(declare-fun b!145682 () Bool)

(declare-fun lt!225780 () (_ BitVec 64))

(assert (=> b!145682 (= e!97125 (bvsle lt!225778 (bvmul lt!225780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!145682 (or (= lt!225780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!225780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!225780)))))

(assert (=> b!145682 (= lt!225780 ((_ sign_extend 32) (size!2998 (buf!3437 (_2!6859 lt!225255)))))))

(assert (= (and d!46537 res!121832) b!145681))

(assert (= (and b!145681 res!121831) b!145682))

(declare-fun m!224275 () Bool)

(assert (=> d!46537 m!224275))

(declare-fun m!224277 () Bool)

(assert (=> d!46537 m!224277))

(assert (=> b!145441 d!46537))

(assert (=> b!145441 d!46411))

(declare-fun lt!225781 () tuple3!558)

(declare-fun d!46539 () Bool)

(assert (=> d!46539 (= lt!225781 (readByteArrayLoop!0 (_1!6860 lt!225269) arr!237 from!447 to!404))))

(assert (=> d!46539 (= (readByteArrayLoopPure!0 (_1!6860 lt!225269) arr!237 from!447 to!404) (tuple2!13031 (_2!6872 lt!225781) (_3!346 lt!225781)))))

(declare-fun bs!11416 () Bool)

(assert (= bs!11416 d!46539))

(declare-fun m!224279 () Bool)

(assert (=> bs!11416 m!224279))

(assert (=> b!145439 d!46539))

(push 1)

(assert (not d!46497))

(assert (not b!145554))

(assert (not d!46431))

(assert (not d!46539))

(assert (not d!46411))

(assert (not d!46509))

(assert (not d!46427))

(assert (not d!46443))

(assert (not b!145680))

(assert (not d!46449))

(assert (not b!145619))

(assert (not b!145646))

(assert (not b!145661))

(assert (not d!46523))

(assert (not d!46499))

(assert (not b!145556))

(assert (not d!46433))

(assert (not b!145660))

(assert (not b!145640))

(assert (not d!46527))

(assert (not b!145648))

(assert (not d!46437))

(assert (not b!145557))

(assert (not b!145636))

(assert (not d!46423))

(assert (not b!145671))

(assert (not d!46531))

(assert (not d!46435))

(assert (not d!46415))

(assert (not b!145641))

(assert (not b!145564))

(assert (not b!145617))

(assert (not b!145618))

(assert (not d!46425))

(assert (not b!145616))

(assert (not d!46537))

(assert (not d!46451))

(assert (not d!46521))

(assert (not b!145633))

(assert (not b!145566))

(assert (not d!46439))

(assert (not d!46483))

(assert (not d!46519))

(assert (not b!145553))

(assert (not d!46417))

(assert (not b!145662))

(assert (not b!145643))

(assert (not b!145632))

(assert (not d!46447))

(assert (not d!46429))

(assert (not b!145637))

(assert (not d!46441))

(assert (not b!145644))

(assert (not b!145669))

(assert (not b!145620))

(assert (not d!46413))

(assert (not d!46511))

(assert (not b!145634))

(check-sat)

(pop 1)

(push 1)

(check-sat)


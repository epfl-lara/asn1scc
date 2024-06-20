; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52644 () Bool)

(assert start!52644)

(declare-fun b!243652 () Bool)

(declare-fun res!203585 () Bool)

(declare-fun e!168906 () Bool)

(assert (=> b!243652 (=> (not res!203585) (not e!168906))))

(declare-datatypes ((array!13356 0))(
  ( (array!13357 (arr!6843 (Array (_ BitVec 32) (_ BitVec 8))) (size!5856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10634 0))(
  ( (BitStream!10635 (buf!6325 array!13356) (currentByte!11697 (_ BitVec 32)) (currentBit!11692 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10634)

(declare-datatypes ((Unit!17801 0))(
  ( (Unit!17802) )
))
(declare-datatypes ((tuple2!20892 0))(
  ( (tuple2!20893 (_1!11368 Unit!17801) (_2!11368 BitStream!10634)) )
))
(declare-fun lt!379636 () tuple2!20892)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243652 (= res!203585 (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(declare-fun b!243653 () Bool)

(declare-fun e!168904 () Bool)

(declare-fun e!168905 () Bool)

(assert (=> b!243653 (= e!168904 e!168905)))

(declare-fun res!203580 () Bool)

(assert (=> b!243653 (=> (not res!203580) (not e!168905))))

(declare-fun lt!379635 () tuple2!20892)

(declare-fun lt!379630 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243653 (= res!203580 (= (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379635))) (currentByte!11697 (_2!11368 lt!379635)) (currentBit!11692 (_2!11368 lt!379635))) (bvadd (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))) lt!379630)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!243653 (= lt!379630 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((tuple2!20894 0))(
  ( (tuple2!20895 (_1!11369 BitStream!10634) (_2!11369 BitStream!10634)) )
))
(declare-fun lt!379623 () tuple2!20894)

(declare-fun b!243654 () Bool)

(declare-fun e!168908 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243654 (= e!168908 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11369 lt!379623)))) ((_ sign_extend 32) (currentByte!11697 (_1!11369 lt!379623))) ((_ sign_extend 32) (currentBit!11692 (_1!11369 lt!379623))) (bvsub nBits!297 from!289))))))

(assert (=> b!243654 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379634 () Unit!17801)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10634 array!13356 (_ BitVec 64)) Unit!17801)

(assert (=> b!243654 (= lt!379634 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6325 (_2!11368 lt!379635)) (bvsub nBits!297 from!289)))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20896 0))(
  ( (tuple2!20897 (_1!11370 BitStream!10634) (_2!11370 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10634) tuple2!20896)

(assert (=> b!243654 (= (_2!11370 (readBitPure!0 (_1!11369 lt!379623))) bit!26)))

(declare-fun lt!379622 () tuple2!20894)

(declare-fun reader!0 (BitStream!10634 BitStream!10634) tuple2!20894)

(assert (=> b!243654 (= lt!379622 (reader!0 (_2!11368 lt!379636) (_2!11368 lt!379635)))))

(assert (=> b!243654 (= lt!379623 (reader!0 thiss!1005 (_2!11368 lt!379635)))))

(declare-fun e!168907 () Bool)

(assert (=> b!243654 e!168907))

(declare-fun res!203590 () Bool)

(assert (=> b!243654 (=> (not res!203590) (not e!168907))))

(declare-fun lt!379632 () tuple2!20896)

(declare-fun lt!379626 () tuple2!20896)

(assert (=> b!243654 (= res!203590 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!379632))) (currentByte!11697 (_1!11370 lt!379632)) (currentBit!11692 (_1!11370 lt!379632))) (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!379626))) (currentByte!11697 (_1!11370 lt!379626)) (currentBit!11692 (_1!11370 lt!379626)))))))

(declare-fun lt!379627 () Unit!17801)

(declare-fun lt!379629 () BitStream!10634)

(declare-fun readBitPrefixLemma!0 (BitStream!10634 BitStream!10634) Unit!17801)

(assert (=> b!243654 (= lt!379627 (readBitPrefixLemma!0 lt!379629 (_2!11368 lt!379635)))))

(assert (=> b!243654 (= lt!379626 (readBitPure!0 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005))))))

(assert (=> b!243654 (= lt!379632 (readBitPure!0 lt!379629))))

(assert (=> b!243654 (= lt!379629 (BitStream!10635 (buf!6325 (_2!11368 lt!379636)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(assert (=> b!243654 e!168906))

(declare-fun res!203587 () Bool)

(assert (=> b!243654 (=> (not res!203587) (not e!168906))))

(declare-fun isPrefixOf!0 (BitStream!10634 BitStream!10634) Bool)

(assert (=> b!243654 (= res!203587 (isPrefixOf!0 thiss!1005 (_2!11368 lt!379635)))))

(declare-fun lt!379625 () Unit!17801)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10634 BitStream!10634 BitStream!10634) Unit!17801)

(assert (=> b!243654 (= lt!379625 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11368 lt!379636) (_2!11368 lt!379635)))))

(assert (=> b!243654 e!168904))

(declare-fun res!203582 () Bool)

(assert (=> b!243654 (=> (not res!203582) (not e!168904))))

(assert (=> b!243654 (= res!203582 (= (size!5856 (buf!6325 (_2!11368 lt!379636))) (size!5856 (buf!6325 (_2!11368 lt!379635)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10634 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20892)

(assert (=> b!243654 (= lt!379635 (appendNBitsLoop!0 (_2!11368 lt!379636) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243654 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379637 () Unit!17801)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10634 BitStream!10634 (_ BitVec 64) (_ BitVec 64)) Unit!17801)

(assert (=> b!243654 (= lt!379637 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11368 lt!379636) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168902 () Bool)

(assert (=> b!243654 e!168902))

(declare-fun res!203588 () Bool)

(assert (=> b!243654 (=> (not res!203588) (not e!168902))))

(assert (=> b!243654 (= res!203588 (= (size!5856 (buf!6325 thiss!1005)) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(declare-fun appendBit!0 (BitStream!10634 Bool) tuple2!20892)

(assert (=> b!243654 (= lt!379636 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243655 () Bool)

(declare-fun lt!379621 () tuple2!20896)

(declare-fun lt!379633 () tuple2!20894)

(assert (=> b!243655 (= e!168905 (not (or (not (_2!11370 lt!379621)) (not (= (_1!11370 lt!379621) (_2!11369 lt!379633))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10634 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20896)

(assert (=> b!243655 (= lt!379621 (checkBitsLoopPure!0 (_1!11369 lt!379633) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243655 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) lt!379630)))

(declare-fun lt!379631 () Unit!17801)

(assert (=> b!243655 (= lt!379631 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11368 lt!379636) (buf!6325 (_2!11368 lt!379635)) lt!379630))))

(assert (=> b!243655 (= lt!379633 (reader!0 (_2!11368 lt!379636) (_2!11368 lt!379635)))))

(declare-fun res!203592 () Bool)

(assert (=> start!52644 (=> (not res!203592) (not e!168908))))

(assert (=> start!52644 (= res!203592 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52644 e!168908))

(assert (=> start!52644 true))

(declare-fun e!168903 () Bool)

(declare-fun inv!12 (BitStream!10634) Bool)

(assert (=> start!52644 (and (inv!12 thiss!1005) e!168903)))

(declare-fun b!243656 () Bool)

(declare-fun res!203591 () Bool)

(assert (=> b!243656 (=> (not res!203591) (not e!168905))))

(assert (=> b!243656 (= res!203591 (isPrefixOf!0 (_2!11368 lt!379636) (_2!11368 lt!379635)))))

(declare-fun b!243657 () Bool)

(assert (=> b!243657 (= e!168906 (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379635)))))))

(declare-fun b!243658 () Bool)

(declare-fun e!168911 () Bool)

(assert (=> b!243658 (= e!168902 e!168911)))

(declare-fun res!203584 () Bool)

(assert (=> b!243658 (=> (not res!203584) (not e!168911))))

(declare-fun lt!379624 () (_ BitVec 64))

(declare-fun lt!379628 () (_ BitVec 64))

(assert (=> b!243658 (= res!203584 (= lt!379624 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379628)))))

(assert (=> b!243658 (= lt!379624 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))))))

(assert (=> b!243658 (= lt!379628 (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(declare-fun b!243659 () Bool)

(declare-fun array_inv!5597 (array!13356) Bool)

(assert (=> b!243659 (= e!168903 (array_inv!5597 (buf!6325 thiss!1005)))))

(declare-fun b!243660 () Bool)

(declare-fun res!203581 () Bool)

(assert (=> b!243660 (=> (not res!203581) (not e!168911))))

(assert (=> b!243660 (= res!203581 (isPrefixOf!0 thiss!1005 (_2!11368 lt!379636)))))

(declare-fun b!243661 () Bool)

(declare-fun res!203589 () Bool)

(assert (=> b!243661 (=> (not res!203589) (not e!168908))))

(assert (=> b!243661 (= res!203589 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243662 () Bool)

(declare-fun res!203583 () Bool)

(assert (=> b!243662 (=> (not res!203583) (not e!168908))))

(assert (=> b!243662 (= res!203583 (bvslt from!289 nBits!297))))

(declare-fun b!243663 () Bool)

(assert (=> b!243663 (= e!168907 (= (_2!11370 lt!379632) (_2!11370 lt!379626)))))

(declare-fun b!243664 () Bool)

(declare-fun e!168909 () Bool)

(assert (=> b!243664 (= e!168911 e!168909)))

(declare-fun res!203586 () Bool)

(assert (=> b!243664 (=> (not res!203586) (not e!168909))))

(declare-fun lt!379638 () tuple2!20896)

(assert (=> b!243664 (= res!203586 (and (= (_2!11370 lt!379638) bit!26) (= (_1!11370 lt!379638) (_2!11368 lt!379636))))))

(declare-fun readerFrom!0 (BitStream!10634 (_ BitVec 32) (_ BitVec 32)) BitStream!10634)

(assert (=> b!243664 (= lt!379638 (readBitPure!0 (readerFrom!0 (_2!11368 lt!379636) (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005))))))

(declare-fun b!243665 () Bool)

(assert (=> b!243665 (= e!168909 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!379638))) (currentByte!11697 (_1!11370 lt!379638)) (currentBit!11692 (_1!11370 lt!379638))) lt!379624))))

(assert (= (and start!52644 res!203592) b!243661))

(assert (= (and b!243661 res!203589) b!243662))

(assert (= (and b!243662 res!203583) b!243654))

(assert (= (and b!243654 res!203588) b!243658))

(assert (= (and b!243658 res!203584) b!243660))

(assert (= (and b!243660 res!203581) b!243664))

(assert (= (and b!243664 res!203586) b!243665))

(assert (= (and b!243654 res!203582) b!243653))

(assert (= (and b!243653 res!203580) b!243656))

(assert (= (and b!243656 res!203591) b!243655))

(assert (= (and b!243654 res!203587) b!243652))

(assert (= (and b!243652 res!203585) b!243657))

(assert (= (and b!243654 res!203590) b!243663))

(assert (= start!52644 b!243659))

(declare-fun m!367109 () Bool)

(assert (=> b!243660 m!367109))

(declare-fun m!367111 () Bool)

(assert (=> b!243656 m!367111))

(declare-fun m!367113 () Bool)

(assert (=> b!243661 m!367113))

(declare-fun m!367115 () Bool)

(assert (=> b!243653 m!367115))

(declare-fun m!367117 () Bool)

(assert (=> b!243653 m!367117))

(declare-fun m!367119 () Bool)

(assert (=> b!243659 m!367119))

(declare-fun m!367121 () Bool)

(assert (=> b!243655 m!367121))

(declare-fun m!367123 () Bool)

(assert (=> b!243655 m!367123))

(declare-fun m!367125 () Bool)

(assert (=> b!243655 m!367125))

(declare-fun m!367127 () Bool)

(assert (=> b!243655 m!367127))

(assert (=> b!243658 m!367117))

(declare-fun m!367129 () Bool)

(assert (=> b!243658 m!367129))

(declare-fun m!367131 () Bool)

(assert (=> b!243665 m!367131))

(declare-fun m!367133 () Bool)

(assert (=> b!243664 m!367133))

(assert (=> b!243664 m!367133))

(declare-fun m!367135 () Bool)

(assert (=> b!243664 m!367135))

(declare-fun m!367137 () Bool)

(assert (=> start!52644 m!367137))

(declare-fun m!367139 () Bool)

(assert (=> b!243652 m!367139))

(declare-fun m!367141 () Bool)

(assert (=> b!243657 m!367141))

(declare-fun m!367143 () Bool)

(assert (=> b!243654 m!367143))

(declare-fun m!367145 () Bool)

(assert (=> b!243654 m!367145))

(assert (=> b!243654 m!367127))

(declare-fun m!367147 () Bool)

(assert (=> b!243654 m!367147))

(declare-fun m!367149 () Bool)

(assert (=> b!243654 m!367149))

(declare-fun m!367151 () Bool)

(assert (=> b!243654 m!367151))

(declare-fun m!367153 () Bool)

(assert (=> b!243654 m!367153))

(declare-fun m!367155 () Bool)

(assert (=> b!243654 m!367155))

(declare-fun m!367157 () Bool)

(assert (=> b!243654 m!367157))

(declare-fun m!367159 () Bool)

(assert (=> b!243654 m!367159))

(declare-fun m!367161 () Bool)

(assert (=> b!243654 m!367161))

(declare-fun m!367163 () Bool)

(assert (=> b!243654 m!367163))

(declare-fun m!367165 () Bool)

(assert (=> b!243654 m!367165))

(declare-fun m!367167 () Bool)

(assert (=> b!243654 m!367167))

(declare-fun m!367169 () Bool)

(assert (=> b!243654 m!367169))

(declare-fun m!367171 () Bool)

(assert (=> b!243654 m!367171))

(declare-fun m!367173 () Bool)

(assert (=> b!243654 m!367173))

(push 1)

(assert (not b!243653))

(assert (not b!243654))

(assert (not b!243652))

(assert (not b!243655))

(assert (not b!243657))

(assert (not start!52644))

(assert (not b!243665))

(assert (not b!243659))

(assert (not b!243658))

(assert (not b!243661))

(assert (not b!243660))

(assert (not b!243656))

(assert (not b!243664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81846 () Bool)

(declare-fun res!203753 () Bool)

(declare-fun e!169011 () Bool)

(assert (=> d!81846 (=> (not res!203753) (not e!169011))))

(assert (=> d!81846 (= res!203753 (= (size!5856 (buf!6325 (_2!11368 lt!379636))) (size!5856 (buf!6325 (_2!11368 lt!379635)))))))

(assert (=> d!81846 (= (isPrefixOf!0 (_2!11368 lt!379636) (_2!11368 lt!379635)) e!169011)))

(declare-fun b!243842 () Bool)

(declare-fun res!203755 () Bool)

(assert (=> b!243842 (=> (not res!203755) (not e!169011))))

(assert (=> b!243842 (= res!203755 (bvsle (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))) (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379635))) (currentByte!11697 (_2!11368 lt!379635)) (currentBit!11692 (_2!11368 lt!379635)))))))

(declare-fun b!243843 () Bool)

(declare-fun e!169010 () Bool)

(assert (=> b!243843 (= e!169011 e!169010)))

(declare-fun res!203754 () Bool)

(assert (=> b!243843 (=> res!203754 e!169010)))

(assert (=> b!243843 (= res!203754 (= (size!5856 (buf!6325 (_2!11368 lt!379636))) #b00000000000000000000000000000000))))

(declare-fun b!243844 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13356 array!13356 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243844 (= e!169010 (arrayBitRangesEq!0 (buf!6325 (_2!11368 lt!379636)) (buf!6325 (_2!11368 lt!379635)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636)))))))

(assert (= (and d!81846 res!203753) b!243842))

(assert (= (and b!243842 res!203755) b!243843))

(assert (= (and b!243843 (not res!203754)) b!243844))

(assert (=> b!243842 m!367117))

(assert (=> b!243842 m!367115))

(assert (=> b!243844 m!367117))

(assert (=> b!243844 m!367117))

(declare-fun m!367475 () Bool)

(assert (=> b!243844 m!367475))

(assert (=> b!243656 d!81846))

(declare-fun d!81848 () Bool)

(declare-datatypes ((tuple2!20902 0))(
  ( (tuple2!20903 (_1!11373 Bool) (_2!11373 BitStream!10634)) )
))
(declare-fun lt!380031 () tuple2!20902)

(declare-fun checkBitsLoop!0 (BitStream!10634 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20902)

(assert (=> d!81848 (= lt!380031 (checkBitsLoop!0 (_1!11369 lt!379633) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81848 (= (checkBitsLoopPure!0 (_1!11369 lt!379633) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20897 (_2!11373 lt!380031) (_1!11373 lt!380031)))))

(declare-fun bs!20701 () Bool)

(assert (= bs!20701 d!81848))

(declare-fun m!367477 () Bool)

(assert (=> bs!20701 m!367477))

(assert (=> b!243655 d!81848))

(declare-fun d!81850 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) lt!379630) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636)))) lt!379630))))

(declare-fun bs!20702 () Bool)

(assert (= bs!20702 d!81850))

(declare-fun m!367479 () Bool)

(assert (=> bs!20702 m!367479))

(assert (=> b!243655 d!81850))

(declare-fun d!81852 () Bool)

(assert (=> d!81852 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) lt!379630)))

(declare-fun lt!380034 () Unit!17801)

(declare-fun choose!9 (BitStream!10634 array!13356 (_ BitVec 64) BitStream!10634) Unit!17801)

(assert (=> d!81852 (= lt!380034 (choose!9 (_2!11368 lt!379636) (buf!6325 (_2!11368 lt!379635)) lt!379630 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636)))))))

(assert (=> d!81852 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11368 lt!379636) (buf!6325 (_2!11368 lt!379635)) lt!379630) lt!380034)))

(declare-fun bs!20703 () Bool)

(assert (= bs!20703 d!81852))

(assert (=> bs!20703 m!367123))

(declare-fun m!367481 () Bool)

(assert (=> bs!20703 m!367481))

(assert (=> b!243655 d!81852))

(declare-fun d!81854 () Bool)

(declare-fun e!169016 () Bool)

(assert (=> d!81854 e!169016))

(declare-fun res!203763 () Bool)

(assert (=> d!81854 (=> (not res!203763) (not e!169016))))

(declare-fun lt!380094 () tuple2!20894)

(assert (=> d!81854 (= res!203763 (isPrefixOf!0 (_1!11369 lt!380094) (_2!11369 lt!380094)))))

(declare-fun lt!380091 () BitStream!10634)

(assert (=> d!81854 (= lt!380094 (tuple2!20895 lt!380091 (_2!11368 lt!379635)))))

(declare-fun lt!380077 () Unit!17801)

(declare-fun lt!380085 () Unit!17801)

(assert (=> d!81854 (= lt!380077 lt!380085)))

(assert (=> d!81854 (isPrefixOf!0 lt!380091 (_2!11368 lt!379635))))

(assert (=> d!81854 (= lt!380085 (lemmaIsPrefixTransitive!0 lt!380091 (_2!11368 lt!379635) (_2!11368 lt!379635)))))

(declare-fun lt!380080 () Unit!17801)

(declare-fun lt!380088 () Unit!17801)

(assert (=> d!81854 (= lt!380080 lt!380088)))

(assert (=> d!81854 (isPrefixOf!0 lt!380091 (_2!11368 lt!379635))))

(assert (=> d!81854 (= lt!380088 (lemmaIsPrefixTransitive!0 lt!380091 (_2!11368 lt!379636) (_2!11368 lt!379635)))))

(declare-fun lt!380084 () Unit!17801)

(declare-fun e!169017 () Unit!17801)

(assert (=> d!81854 (= lt!380084 e!169017)))

(declare-fun c!11463 () Bool)

(assert (=> d!81854 (= c!11463 (not (= (size!5856 (buf!6325 (_2!11368 lt!379636))) #b00000000000000000000000000000000)))))

(declare-fun lt!380082 () Unit!17801)

(declare-fun lt!380086 () Unit!17801)

(assert (=> d!81854 (= lt!380082 lt!380086)))

(assert (=> d!81854 (isPrefixOf!0 (_2!11368 lt!379635) (_2!11368 lt!379635))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10634) Unit!17801)

(assert (=> d!81854 (= lt!380086 (lemmaIsPrefixRefl!0 (_2!11368 lt!379635)))))

(declare-fun lt!380075 () Unit!17801)

(declare-fun lt!380087 () Unit!17801)

(assert (=> d!81854 (= lt!380075 lt!380087)))

(assert (=> d!81854 (= lt!380087 (lemmaIsPrefixRefl!0 (_2!11368 lt!379635)))))

(declare-fun lt!380083 () Unit!17801)

(declare-fun lt!380093 () Unit!17801)

(assert (=> d!81854 (= lt!380083 lt!380093)))

(assert (=> d!81854 (isPrefixOf!0 lt!380091 lt!380091)))

(assert (=> d!81854 (= lt!380093 (lemmaIsPrefixRefl!0 lt!380091))))

(declare-fun lt!380079 () Unit!17801)

(declare-fun lt!380089 () Unit!17801)

(assert (=> d!81854 (= lt!380079 lt!380089)))

(assert (=> d!81854 (isPrefixOf!0 (_2!11368 lt!379636) (_2!11368 lt!379636))))

(assert (=> d!81854 (= lt!380089 (lemmaIsPrefixRefl!0 (_2!11368 lt!379636)))))

(assert (=> d!81854 (= lt!380091 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))))))

(assert (=> d!81854 (isPrefixOf!0 (_2!11368 lt!379636) (_2!11368 lt!379635))))

(assert (=> d!81854 (= (reader!0 (_2!11368 lt!379636) (_2!11368 lt!379635)) lt!380094)))

(declare-fun b!243855 () Bool)

(declare-fun res!203762 () Bool)

(assert (=> b!243855 (=> (not res!203762) (not e!169016))))

(assert (=> b!243855 (= res!203762 (isPrefixOf!0 (_1!11369 lt!380094) (_2!11368 lt!379636)))))

(declare-fun b!243856 () Bool)

(declare-fun Unit!17807 () Unit!17801)

(assert (=> b!243856 (= e!169017 Unit!17807)))

(declare-fun b!243857 () Bool)

(declare-fun res!203764 () Bool)

(assert (=> b!243857 (=> (not res!203764) (not e!169016))))

(assert (=> b!243857 (= res!203764 (isPrefixOf!0 (_2!11369 lt!380094) (_2!11368 lt!379635)))))

(declare-fun b!243858 () Bool)

(declare-fun lt!380092 () Unit!17801)

(assert (=> b!243858 (= e!169017 lt!380092)))

(declare-fun lt!380090 () (_ BitVec 64))

(assert (=> b!243858 (= lt!380090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!380076 () (_ BitVec 64))

(assert (=> b!243858 (= lt!380076 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13356 array!13356 (_ BitVec 64) (_ BitVec 64)) Unit!17801)

(assert (=> b!243858 (= lt!380092 (arrayBitRangesEqSymmetric!0 (buf!6325 (_2!11368 lt!379636)) (buf!6325 (_2!11368 lt!379635)) lt!380090 lt!380076))))

(assert (=> b!243858 (arrayBitRangesEq!0 (buf!6325 (_2!11368 lt!379635)) (buf!6325 (_2!11368 lt!379636)) lt!380090 lt!380076)))

(declare-fun b!243859 () Bool)

(declare-fun lt!380078 () (_ BitVec 64))

(declare-fun lt!380081 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10634 (_ BitVec 64)) BitStream!10634)

(assert (=> b!243859 (= e!169016 (= (_1!11369 lt!380094) (withMovedBitIndex!0 (_2!11369 lt!380094) (bvsub lt!380081 lt!380078))))))

(assert (=> b!243859 (or (= (bvand lt!380081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380081 lt!380078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243859 (= lt!380078 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379635))) (currentByte!11697 (_2!11368 lt!379635)) (currentBit!11692 (_2!11368 lt!379635))))))

(assert (=> b!243859 (= lt!380081 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))))))

(assert (= (and d!81854 c!11463) b!243858))

(assert (= (and d!81854 (not c!11463)) b!243856))

(assert (= (and d!81854 res!203763) b!243855))

(assert (= (and b!243855 res!203762) b!243857))

(assert (= (and b!243857 res!203764) b!243859))

(declare-fun m!367483 () Bool)

(assert (=> b!243857 m!367483))

(declare-fun m!367485 () Bool)

(assert (=> b!243855 m!367485))

(declare-fun m!367487 () Bool)

(assert (=> d!81854 m!367487))

(declare-fun m!367489 () Bool)

(assert (=> d!81854 m!367489))

(declare-fun m!367491 () Bool)

(assert (=> d!81854 m!367491))

(declare-fun m!367493 () Bool)

(assert (=> d!81854 m!367493))

(declare-fun m!367495 () Bool)

(assert (=> d!81854 m!367495))

(declare-fun m!367497 () Bool)

(assert (=> d!81854 m!367497))

(declare-fun m!367499 () Bool)

(assert (=> d!81854 m!367499))

(declare-fun m!367501 () Bool)

(assert (=> d!81854 m!367501))

(declare-fun m!367503 () Bool)

(assert (=> d!81854 m!367503))

(assert (=> d!81854 m!367111))

(declare-fun m!367505 () Bool)

(assert (=> d!81854 m!367505))

(assert (=> b!243858 m!367117))

(declare-fun m!367507 () Bool)

(assert (=> b!243858 m!367507))

(declare-fun m!367509 () Bool)

(assert (=> b!243858 m!367509))

(declare-fun m!367511 () Bool)

(assert (=> b!243859 m!367511))

(assert (=> b!243859 m!367115))

(assert (=> b!243859 m!367117))

(assert (=> b!243655 d!81854))

(declare-fun d!81856 () Bool)

(declare-fun e!169020 () Bool)

(assert (=> d!81856 e!169020))

(declare-fun res!203770 () Bool)

(assert (=> d!81856 (=> (not res!203770) (not e!169020))))

(declare-fun lt!380108 () (_ BitVec 64))

(declare-fun lt!380111 () (_ BitVec 64))

(declare-fun lt!380110 () (_ BitVec 64))

(assert (=> d!81856 (= res!203770 (= lt!380111 (bvsub lt!380110 lt!380108)))))

(assert (=> d!81856 (or (= (bvand lt!380110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380108 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380110 lt!380108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81856 (= lt!380108 (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379638)))) ((_ sign_extend 32) (currentByte!11697 (_1!11370 lt!379638))) ((_ sign_extend 32) (currentBit!11692 (_1!11370 lt!379638)))))))

(declare-fun lt!380109 () (_ BitVec 64))

(declare-fun lt!380112 () (_ BitVec 64))

(assert (=> d!81856 (= lt!380110 (bvmul lt!380109 lt!380112))))

(assert (=> d!81856 (or (= lt!380109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380112 (bvsdiv (bvmul lt!380109 lt!380112) lt!380109)))))

(assert (=> d!81856 (= lt!380112 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81856 (= lt!380109 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379638)))))))

(assert (=> d!81856 (= lt!380111 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11697 (_1!11370 lt!379638))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11692 (_1!11370 lt!379638)))))))

(assert (=> d!81856 (invariant!0 (currentBit!11692 (_1!11370 lt!379638)) (currentByte!11697 (_1!11370 lt!379638)) (size!5856 (buf!6325 (_1!11370 lt!379638))))))

(assert (=> d!81856 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!379638))) (currentByte!11697 (_1!11370 lt!379638)) (currentBit!11692 (_1!11370 lt!379638))) lt!380111)))

(declare-fun b!243864 () Bool)

(declare-fun res!203769 () Bool)

(assert (=> b!243864 (=> (not res!203769) (not e!169020))))

(assert (=> b!243864 (= res!203769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380111))))

(declare-fun b!243865 () Bool)

(declare-fun lt!380107 () (_ BitVec 64))

(assert (=> b!243865 (= e!169020 (bvsle lt!380111 (bvmul lt!380107 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243865 (or (= lt!380107 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380107 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380107)))))

(assert (=> b!243865 (= lt!380107 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379638)))))))

(assert (= (and d!81856 res!203770) b!243864))

(assert (= (and b!243864 res!203769) b!243865))

(declare-fun m!367513 () Bool)

(assert (=> d!81856 m!367513))

(declare-fun m!367515 () Bool)

(assert (=> d!81856 m!367515))

(assert (=> b!243665 d!81856))

(declare-fun d!81858 () Bool)

(declare-fun e!169021 () Bool)

(assert (=> d!81858 e!169021))

(declare-fun res!203772 () Bool)

(assert (=> d!81858 (=> (not res!203772) (not e!169021))))

(declare-fun lt!380132 () tuple2!20894)

(assert (=> d!81858 (= res!203772 (isPrefixOf!0 (_1!11369 lt!380132) (_2!11369 lt!380132)))))

(declare-fun lt!380129 () BitStream!10634)

(assert (=> d!81858 (= lt!380132 (tuple2!20895 lt!380129 (_2!11368 lt!379635)))))

(declare-fun lt!380115 () Unit!17801)

(declare-fun lt!380123 () Unit!17801)

(assert (=> d!81858 (= lt!380115 lt!380123)))

(assert (=> d!81858 (isPrefixOf!0 lt!380129 (_2!11368 lt!379635))))

(assert (=> d!81858 (= lt!380123 (lemmaIsPrefixTransitive!0 lt!380129 (_2!11368 lt!379635) (_2!11368 lt!379635)))))

(declare-fun lt!380118 () Unit!17801)

(declare-fun lt!380126 () Unit!17801)

(assert (=> d!81858 (= lt!380118 lt!380126)))

(assert (=> d!81858 (isPrefixOf!0 lt!380129 (_2!11368 lt!379635))))

(assert (=> d!81858 (= lt!380126 (lemmaIsPrefixTransitive!0 lt!380129 thiss!1005 (_2!11368 lt!379635)))))

(declare-fun lt!380122 () Unit!17801)

(declare-fun e!169022 () Unit!17801)

(assert (=> d!81858 (= lt!380122 e!169022)))

(declare-fun c!11464 () Bool)

(assert (=> d!81858 (= c!11464 (not (= (size!5856 (buf!6325 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!380120 () Unit!17801)

(declare-fun lt!380124 () Unit!17801)

(assert (=> d!81858 (= lt!380120 lt!380124)))

(assert (=> d!81858 (isPrefixOf!0 (_2!11368 lt!379635) (_2!11368 lt!379635))))

(assert (=> d!81858 (= lt!380124 (lemmaIsPrefixRefl!0 (_2!11368 lt!379635)))))

(declare-fun lt!380113 () Unit!17801)

(declare-fun lt!380125 () Unit!17801)

(assert (=> d!81858 (= lt!380113 lt!380125)))

(assert (=> d!81858 (= lt!380125 (lemmaIsPrefixRefl!0 (_2!11368 lt!379635)))))

(declare-fun lt!380121 () Unit!17801)

(declare-fun lt!380131 () Unit!17801)

(assert (=> d!81858 (= lt!380121 lt!380131)))

(assert (=> d!81858 (isPrefixOf!0 lt!380129 lt!380129)))

(assert (=> d!81858 (= lt!380131 (lemmaIsPrefixRefl!0 lt!380129))))

(declare-fun lt!380117 () Unit!17801)

(declare-fun lt!380127 () Unit!17801)

(assert (=> d!81858 (= lt!380117 lt!380127)))

(assert (=> d!81858 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81858 (= lt!380127 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81858 (= lt!380129 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(assert (=> d!81858 (isPrefixOf!0 thiss!1005 (_2!11368 lt!379635))))

(assert (=> d!81858 (= (reader!0 thiss!1005 (_2!11368 lt!379635)) lt!380132)))

(declare-fun b!243866 () Bool)

(declare-fun res!203771 () Bool)

(assert (=> b!243866 (=> (not res!203771) (not e!169021))))

(assert (=> b!243866 (= res!203771 (isPrefixOf!0 (_1!11369 lt!380132) thiss!1005))))

(declare-fun b!243867 () Bool)

(declare-fun Unit!17808 () Unit!17801)

(assert (=> b!243867 (= e!169022 Unit!17808)))

(declare-fun b!243868 () Bool)

(declare-fun res!203773 () Bool)

(assert (=> b!243868 (=> (not res!203773) (not e!169021))))

(assert (=> b!243868 (= res!203773 (isPrefixOf!0 (_2!11369 lt!380132) (_2!11368 lt!379635)))))

(declare-fun b!243869 () Bool)

(declare-fun lt!380130 () Unit!17801)

(assert (=> b!243869 (= e!169022 lt!380130)))

(declare-fun lt!380128 () (_ BitVec 64))

(assert (=> b!243869 (= lt!380128 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!380114 () (_ BitVec 64))

(assert (=> b!243869 (= lt!380114 (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(assert (=> b!243869 (= lt!380130 (arrayBitRangesEqSymmetric!0 (buf!6325 thiss!1005) (buf!6325 (_2!11368 lt!379635)) lt!380128 lt!380114))))

(assert (=> b!243869 (arrayBitRangesEq!0 (buf!6325 (_2!11368 lt!379635)) (buf!6325 thiss!1005) lt!380128 lt!380114)))

(declare-fun lt!380119 () (_ BitVec 64))

(declare-fun lt!380116 () (_ BitVec 64))

(declare-fun b!243870 () Bool)

(assert (=> b!243870 (= e!169021 (= (_1!11369 lt!380132) (withMovedBitIndex!0 (_2!11369 lt!380132) (bvsub lt!380119 lt!380116))))))

(assert (=> b!243870 (or (= (bvand lt!380119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380119 lt!380116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243870 (= lt!380116 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379635))) (currentByte!11697 (_2!11368 lt!379635)) (currentBit!11692 (_2!11368 lt!379635))))))

(assert (=> b!243870 (= lt!380119 (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(assert (= (and d!81858 c!11464) b!243869))

(assert (= (and d!81858 (not c!11464)) b!243867))

(assert (= (and d!81858 res!203772) b!243866))

(assert (= (and b!243866 res!203771) b!243868))

(assert (= (and b!243868 res!203773) b!243870))

(declare-fun m!367517 () Bool)

(assert (=> b!243868 m!367517))

(declare-fun m!367519 () Bool)

(assert (=> b!243866 m!367519))

(declare-fun m!367521 () Bool)

(assert (=> d!81858 m!367521))

(declare-fun m!367523 () Bool)

(assert (=> d!81858 m!367523))

(declare-fun m!367525 () Bool)

(assert (=> d!81858 m!367525))

(assert (=> d!81858 m!367493))

(declare-fun m!367527 () Bool)

(assert (=> d!81858 m!367527))

(declare-fun m!367529 () Bool)

(assert (=> d!81858 m!367529))

(assert (=> d!81858 m!367499))

(declare-fun m!367531 () Bool)

(assert (=> d!81858 m!367531))

(declare-fun m!367533 () Bool)

(assert (=> d!81858 m!367533))

(assert (=> d!81858 m!367155))

(declare-fun m!367535 () Bool)

(assert (=> d!81858 m!367535))

(assert (=> b!243869 m!367129))

(declare-fun m!367537 () Bool)

(assert (=> b!243869 m!367537))

(declare-fun m!367539 () Bool)

(assert (=> b!243869 m!367539))

(declare-fun m!367541 () Bool)

(assert (=> b!243870 m!367541))

(assert (=> b!243870 m!367115))

(assert (=> b!243870 m!367129))

(assert (=> b!243654 d!81858))

(declare-fun d!81860 () Bool)

(declare-fun lt!380135 () tuple2!20902)

(declare-fun readBit!0 (BitStream!10634) tuple2!20902)

(assert (=> d!81860 (= lt!380135 (readBit!0 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005))))))

(assert (=> d!81860 (= (readBitPure!0 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005))) (tuple2!20897 (_2!11373 lt!380135) (_1!11373 lt!380135)))))

(declare-fun bs!20704 () Bool)

(assert (= bs!20704 d!81860))

(declare-fun m!367543 () Bool)

(assert (=> bs!20704 m!367543))

(assert (=> b!243654 d!81860))

(declare-fun d!81862 () Bool)

(declare-fun e!169023 () Bool)

(assert (=> d!81862 e!169023))

(declare-fun res!203775 () Bool)

(assert (=> d!81862 (=> (not res!203775) (not e!169023))))

(declare-fun lt!380140 () (_ BitVec 64))

(declare-fun lt!380139 () (_ BitVec 64))

(declare-fun lt!380137 () (_ BitVec 64))

(assert (=> d!81862 (= res!203775 (= lt!380140 (bvsub lt!380139 lt!380137)))))

(assert (=> d!81862 (or (= (bvand lt!380139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380139 lt!380137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81862 (= lt!380137 (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379632)))) ((_ sign_extend 32) (currentByte!11697 (_1!11370 lt!379632))) ((_ sign_extend 32) (currentBit!11692 (_1!11370 lt!379632)))))))

(declare-fun lt!380138 () (_ BitVec 64))

(declare-fun lt!380141 () (_ BitVec 64))

(assert (=> d!81862 (= lt!380139 (bvmul lt!380138 lt!380141))))

(assert (=> d!81862 (or (= lt!380138 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380141 (bvsdiv (bvmul lt!380138 lt!380141) lt!380138)))))

(assert (=> d!81862 (= lt!380141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81862 (= lt!380138 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379632)))))))

(assert (=> d!81862 (= lt!380140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11697 (_1!11370 lt!379632))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11692 (_1!11370 lt!379632)))))))

(assert (=> d!81862 (invariant!0 (currentBit!11692 (_1!11370 lt!379632)) (currentByte!11697 (_1!11370 lt!379632)) (size!5856 (buf!6325 (_1!11370 lt!379632))))))

(assert (=> d!81862 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!379632))) (currentByte!11697 (_1!11370 lt!379632)) (currentBit!11692 (_1!11370 lt!379632))) lt!380140)))

(declare-fun b!243871 () Bool)

(declare-fun res!203774 () Bool)

(assert (=> b!243871 (=> (not res!203774) (not e!169023))))

(assert (=> b!243871 (= res!203774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380140))))

(declare-fun b!243872 () Bool)

(declare-fun lt!380136 () (_ BitVec 64))

(assert (=> b!243872 (= e!169023 (bvsle lt!380140 (bvmul lt!380136 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243872 (or (= lt!380136 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380136 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380136)))))

(assert (=> b!243872 (= lt!380136 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379632)))))))

(assert (= (and d!81862 res!203775) b!243871))

(assert (= (and b!243871 res!203774) b!243872))

(declare-fun m!367545 () Bool)

(assert (=> d!81862 m!367545))

(declare-fun m!367547 () Bool)

(assert (=> d!81862 m!367547))

(assert (=> b!243654 d!81862))

(declare-fun b!243881 () Bool)

(declare-fun res!203785 () Bool)

(declare-fun e!169029 () Bool)

(assert (=> b!243881 (=> (not res!203785) (not e!169029))))

(declare-fun lt!380164 () (_ BitVec 64))

(declare-fun lt!380162 () (_ BitVec 64))

(declare-fun lt!380163 () tuple2!20892)

(assert (=> b!243881 (= res!203785 (= (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!380163))) (currentByte!11697 (_2!11368 lt!380163)) (currentBit!11692 (_2!11368 lt!380163))) (bvadd lt!380162 lt!380164)))))

(assert (=> b!243881 (or (not (= (bvand lt!380162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380164 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!380162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!380162 lt!380164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243881 (= lt!380164 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243881 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243881 (= lt!380162 (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))))))

(declare-fun b!243882 () Bool)

(declare-fun res!203786 () Bool)

(assert (=> b!243882 (=> (not res!203786) (not e!169029))))

(assert (=> b!243882 (= res!203786 (isPrefixOf!0 (_2!11368 lt!379636) (_2!11368 lt!380163)))))

(declare-fun b!243884 () Bool)

(declare-fun e!169028 () Bool)

(declare-fun lt!380159 () (_ BitVec 64))

(assert (=> b!243884 (= e!169028 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) lt!380159))))

(declare-fun b!243883 () Bool)

(declare-fun lt!380158 () tuple2!20896)

(declare-fun lt!380165 () tuple2!20894)

(assert (=> b!243883 (= e!169029 (and (_2!11370 lt!380158) (= (_1!11370 lt!380158) (_2!11369 lt!380165))))))

(assert (=> b!243883 (= lt!380158 (checkBitsLoopPure!0 (_1!11369 lt!380165) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380161 () Unit!17801)

(declare-fun lt!380160 () Unit!17801)

(assert (=> b!243883 (= lt!380161 lt!380160)))

(assert (=> b!243883 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!380163)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) lt!380159)))

(assert (=> b!243883 (= lt!380160 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11368 lt!379636) (buf!6325 (_2!11368 lt!380163)) lt!380159))))

(assert (=> b!243883 e!169028))

(declare-fun res!203784 () Bool)

(assert (=> b!243883 (=> (not res!203784) (not e!169028))))

(assert (=> b!243883 (= res!203784 (and (= (size!5856 (buf!6325 (_2!11368 lt!379636))) (size!5856 (buf!6325 (_2!11368 lt!380163)))) (bvsge lt!380159 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243883 (= lt!380159 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243883 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243883 (= lt!380165 (reader!0 (_2!11368 lt!379636) (_2!11368 lt!380163)))))

(declare-fun d!81864 () Bool)

(assert (=> d!81864 e!169029))

(declare-fun res!203787 () Bool)

(assert (=> d!81864 (=> (not res!203787) (not e!169029))))

(assert (=> d!81864 (= res!203787 (= (size!5856 (buf!6325 (_2!11368 lt!379636))) (size!5856 (buf!6325 (_2!11368 lt!380163)))))))

(declare-fun choose!51 (BitStream!10634 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20892)

(assert (=> d!81864 (= lt!380163 (choose!51 (_2!11368 lt!379636) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81864 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81864 (= (appendNBitsLoop!0 (_2!11368 lt!379636) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!380163)))

(assert (= (and d!81864 res!203787) b!243881))

(assert (= (and b!243881 res!203785) b!243882))

(assert (= (and b!243882 res!203786) b!243883))

(assert (= (and b!243883 res!203784) b!243884))

(declare-fun m!367549 () Bool)

(assert (=> b!243884 m!367549))

(declare-fun m!367551 () Bool)

(assert (=> b!243883 m!367551))

(declare-fun m!367553 () Bool)

(assert (=> b!243883 m!367553))

(declare-fun m!367555 () Bool)

(assert (=> b!243883 m!367555))

(declare-fun m!367557 () Bool)

(assert (=> b!243883 m!367557))

(declare-fun m!367559 () Bool)

(assert (=> b!243882 m!367559))

(declare-fun m!367561 () Bool)

(assert (=> d!81864 m!367561))

(declare-fun m!367563 () Bool)

(assert (=> b!243881 m!367563))

(assert (=> b!243881 m!367117))

(assert (=> b!243654 d!81864))

(declare-fun d!81866 () Bool)

(declare-fun lt!380166 () tuple2!20902)

(assert (=> d!81866 (= lt!380166 (readBit!0 (_1!11369 lt!379623)))))

(assert (=> d!81866 (= (readBitPure!0 (_1!11369 lt!379623)) (tuple2!20897 (_2!11373 lt!380166) (_1!11373 lt!380166)))))

(declare-fun bs!20705 () Bool)

(assert (= bs!20705 d!81866))

(declare-fun m!367565 () Bool)

(assert (=> bs!20705 m!367565))

(assert (=> b!243654 d!81866))

(declare-fun d!81868 () Bool)

(assert (=> d!81868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!20706 () Bool)

(assert (= bs!20706 d!81868))

(declare-fun m!367567 () Bool)

(assert (=> bs!20706 m!367567))

(assert (=> b!243654 d!81868))

(declare-fun d!81870 () Bool)

(assert (=> d!81870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20707 () Bool)

(assert (= bs!20707 d!81870))

(declare-fun m!367569 () Bool)

(assert (=> bs!20707 m!367569))

(assert (=> b!243654 d!81870))

(declare-fun b!243894 () Bool)

(declare-fun res!203799 () Bool)

(declare-fun e!169035 () Bool)

(assert (=> b!243894 (=> (not res!203799) (not e!169035))))

(declare-fun lt!380178 () (_ BitVec 64))

(declare-fun lt!380175 () (_ BitVec 64))

(declare-fun lt!380177 () tuple2!20892)

(assert (=> b!243894 (= res!203799 (= (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!380177))) (currentByte!11697 (_2!11368 lt!380177)) (currentBit!11692 (_2!11368 lt!380177))) (bvadd lt!380175 lt!380178)))))

(assert (=> b!243894 (or (not (= (bvand lt!380175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380178 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!380175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!380175 lt!380178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!243894 (= lt!380178 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!243894 (= lt!380175 (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(declare-fun b!243895 () Bool)

(declare-fun res!203797 () Bool)

(assert (=> b!243895 (=> (not res!203797) (not e!169035))))

(assert (=> b!243895 (= res!203797 (isPrefixOf!0 thiss!1005 (_2!11368 lt!380177)))))

(declare-fun b!243897 () Bool)

(declare-fun e!169034 () Bool)

(declare-fun lt!380176 () tuple2!20896)

(assert (=> b!243897 (= e!169034 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!380176))) (currentByte!11697 (_1!11370 lt!380176)) (currentBit!11692 (_1!11370 lt!380176))) (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!380177))) (currentByte!11697 (_2!11368 lt!380177)) (currentBit!11692 (_2!11368 lt!380177)))))))

(declare-fun d!81872 () Bool)

(assert (=> d!81872 e!169035))

(declare-fun res!203796 () Bool)

(assert (=> d!81872 (=> (not res!203796) (not e!169035))))

(assert (=> d!81872 (= res!203796 (= (size!5856 (buf!6325 thiss!1005)) (size!5856 (buf!6325 (_2!11368 lt!380177)))))))

(declare-fun choose!16 (BitStream!10634 Bool) tuple2!20892)

(assert (=> d!81872 (= lt!380177 (choose!16 thiss!1005 bit!26))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!81872 (validate_offset_bit!0 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005)))))

(assert (=> d!81872 (= (appendBit!0 thiss!1005 bit!26) lt!380177)))

(declare-fun b!243896 () Bool)

(assert (=> b!243896 (= e!169035 e!169034)))

(declare-fun res!203798 () Bool)

(assert (=> b!243896 (=> (not res!203798) (not e!169034))))

(assert (=> b!243896 (= res!203798 (and (= (_2!11370 lt!380176) bit!26) (= (_1!11370 lt!380176) (_2!11368 lt!380177))))))

(assert (=> b!243896 (= lt!380176 (readBitPure!0 (readerFrom!0 (_2!11368 lt!380177) (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005))))))

(assert (= (and d!81872 res!203796) b!243894))

(assert (= (and b!243894 res!203799) b!243895))

(assert (= (and b!243895 res!203797) b!243896))

(assert (= (and b!243896 res!203798) b!243897))

(declare-fun m!367571 () Bool)

(assert (=> d!81872 m!367571))

(declare-fun m!367573 () Bool)

(assert (=> d!81872 m!367573))

(declare-fun m!367575 () Bool)

(assert (=> b!243897 m!367575))

(declare-fun m!367577 () Bool)

(assert (=> b!243897 m!367577))

(assert (=> b!243894 m!367577))

(assert (=> b!243894 m!367129))

(declare-fun m!367579 () Bool)

(assert (=> b!243895 m!367579))

(declare-fun m!367581 () Bool)

(assert (=> b!243896 m!367581))

(assert (=> b!243896 m!367581))

(declare-fun m!367583 () Bool)

(assert (=> b!243896 m!367583))

(assert (=> b!243654 d!81872))

(assert (=> b!243654 d!81854))

(declare-fun d!81874 () Bool)

(declare-fun res!203800 () Bool)

(declare-fun e!169037 () Bool)

(assert (=> d!81874 (=> (not res!203800) (not e!169037))))

(assert (=> d!81874 (= res!203800 (= (size!5856 (buf!6325 thiss!1005)) (size!5856 (buf!6325 (_2!11368 lt!379635)))))))

(assert (=> d!81874 (= (isPrefixOf!0 thiss!1005 (_2!11368 lt!379635)) e!169037)))

(declare-fun b!243898 () Bool)

(declare-fun res!203802 () Bool)

(assert (=> b!243898 (=> (not res!203802) (not e!169037))))

(assert (=> b!243898 (= res!203802 (bvsle (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)) (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379635))) (currentByte!11697 (_2!11368 lt!379635)) (currentBit!11692 (_2!11368 lt!379635)))))))

(declare-fun b!243899 () Bool)

(declare-fun e!169036 () Bool)

(assert (=> b!243899 (= e!169037 e!169036)))

(declare-fun res!203801 () Bool)

(assert (=> b!243899 (=> res!203801 e!169036)))

(assert (=> b!243899 (= res!203801 (= (size!5856 (buf!6325 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!243900 () Bool)

(assert (=> b!243900 (= e!169036 (arrayBitRangesEq!0 (buf!6325 thiss!1005) (buf!6325 (_2!11368 lt!379635)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005))))))

(assert (= (and d!81874 res!203800) b!243898))

(assert (= (and b!243898 res!203802) b!243899))

(assert (= (and b!243899 (not res!203801)) b!243900))

(assert (=> b!243898 m!367129))

(assert (=> b!243898 m!367115))

(assert (=> b!243900 m!367129))

(assert (=> b!243900 m!367129))

(declare-fun m!367585 () Bool)

(assert (=> b!243900 m!367585))

(assert (=> b!243654 d!81874))

(declare-fun d!81876 () Bool)

(declare-fun e!169040 () Bool)

(assert (=> d!81876 e!169040))

(declare-fun res!203805 () Bool)

(assert (=> d!81876 (=> (not res!203805) (not e!169040))))

(declare-fun lt!380188 () tuple2!20896)

(declare-fun lt!380190 () tuple2!20896)

(assert (=> d!81876 (= res!203805 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!380188))) (currentByte!11697 (_1!11370 lt!380188)) (currentBit!11692 (_1!11370 lt!380188))) (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!380190))) (currentByte!11697 (_1!11370 lt!380190)) (currentBit!11692 (_1!11370 lt!380190)))))))

(declare-fun lt!380189 () BitStream!10634)

(declare-fun lt!380187 () Unit!17801)

(declare-fun choose!50 (BitStream!10634 BitStream!10634 BitStream!10634 tuple2!20896 tuple2!20896 BitStream!10634 Bool tuple2!20896 tuple2!20896 BitStream!10634 Bool) Unit!17801)

(assert (=> d!81876 (= lt!380187 (choose!50 lt!379629 (_2!11368 lt!379635) lt!380189 lt!380188 (tuple2!20897 (_1!11370 lt!380188) (_2!11370 lt!380188)) (_1!11370 lt!380188) (_2!11370 lt!380188) lt!380190 (tuple2!20897 (_1!11370 lt!380190) (_2!11370 lt!380190)) (_1!11370 lt!380190) (_2!11370 lt!380190)))))

(assert (=> d!81876 (= lt!380190 (readBitPure!0 lt!380189))))

(assert (=> d!81876 (= lt!380188 (readBitPure!0 lt!379629))))

(assert (=> d!81876 (= lt!380189 (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 lt!379629) (currentBit!11692 lt!379629)))))

(assert (=> d!81876 (invariant!0 (currentBit!11692 lt!379629) (currentByte!11697 lt!379629) (size!5856 (buf!6325 (_2!11368 lt!379635))))))

(assert (=> d!81876 (= (readBitPrefixLemma!0 lt!379629 (_2!11368 lt!379635)) lt!380187)))

(declare-fun b!243903 () Bool)

(assert (=> b!243903 (= e!169040 (= (_2!11370 lt!380188) (_2!11370 lt!380190)))))

(assert (= (and d!81876 res!203805) b!243903))

(declare-fun m!367587 () Bool)

(assert (=> d!81876 m!367587))

(declare-fun m!367589 () Bool)

(assert (=> d!81876 m!367589))

(declare-fun m!367591 () Bool)

(assert (=> d!81876 m!367591))

(declare-fun m!367593 () Bool)

(assert (=> d!81876 m!367593))

(declare-fun m!367595 () Bool)

(assert (=> d!81876 m!367595))

(assert (=> d!81876 m!367159))

(assert (=> b!243654 d!81876))

(declare-fun d!81878 () Bool)

(assert (=> d!81878 (isPrefixOf!0 thiss!1005 (_2!11368 lt!379635))))

(declare-fun lt!380193 () Unit!17801)

(declare-fun choose!30 (BitStream!10634 BitStream!10634 BitStream!10634) Unit!17801)

(assert (=> d!81878 (= lt!380193 (choose!30 thiss!1005 (_2!11368 lt!379636) (_2!11368 lt!379635)))))

(assert (=> d!81878 (isPrefixOf!0 thiss!1005 (_2!11368 lt!379636))))

(assert (=> d!81878 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11368 lt!379636) (_2!11368 lt!379635)) lt!380193)))

(declare-fun bs!20708 () Bool)

(assert (= bs!20708 d!81878))

(assert (=> bs!20708 m!367155))

(declare-fun m!367597 () Bool)

(assert (=> bs!20708 m!367597))

(assert (=> bs!20708 m!367109))

(assert (=> b!243654 d!81878))

(declare-fun d!81880 () Bool)

(assert (=> d!81880 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11369 lt!379623)))) ((_ sign_extend 32) (currentByte!11697 (_1!11369 lt!379623))) ((_ sign_extend 32) (currentBit!11692 (_1!11369 lt!379623))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11369 lt!379623)))) ((_ sign_extend 32) (currentByte!11697 (_1!11369 lt!379623))) ((_ sign_extend 32) (currentBit!11692 (_1!11369 lt!379623)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20709 () Bool)

(assert (= bs!20709 d!81880))

(declare-fun m!367599 () Bool)

(assert (=> bs!20709 m!367599))

(assert (=> b!243654 d!81880))

(declare-fun d!81882 () Bool)

(declare-fun e!169043 () Bool)

(assert (=> d!81882 e!169043))

(declare-fun res!203808 () Bool)

(assert (=> d!81882 (=> (not res!203808) (not e!169043))))

(assert (=> d!81882 (= res!203808 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!380196 () Unit!17801)

(declare-fun choose!27 (BitStream!10634 BitStream!10634 (_ BitVec 64) (_ BitVec 64)) Unit!17801)

(assert (=> d!81882 (= lt!380196 (choose!27 thiss!1005 (_2!11368 lt!379636) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81882 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81882 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11368 lt!379636) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!380196)))

(declare-fun b!243906 () Bool)

(assert (=> b!243906 (= e!169043 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81882 res!203808) b!243906))

(declare-fun m!367601 () Bool)

(assert (=> d!81882 m!367601))

(assert (=> b!243906 m!367171))

(assert (=> b!243654 d!81882))

(declare-fun d!81884 () Bool)

(declare-fun lt!380197 () tuple2!20902)

(assert (=> d!81884 (= lt!380197 (readBit!0 lt!379629))))

(assert (=> d!81884 (= (readBitPure!0 lt!379629) (tuple2!20897 (_2!11373 lt!380197) (_1!11373 lt!380197)))))

(declare-fun bs!20710 () Bool)

(assert (= bs!20710 d!81884))

(declare-fun m!367603 () Bool)

(assert (=> bs!20710 m!367603))

(assert (=> b!243654 d!81884))

(declare-fun d!81886 () Bool)

(declare-fun e!169044 () Bool)

(assert (=> d!81886 e!169044))

(declare-fun res!203810 () Bool)

(assert (=> d!81886 (=> (not res!203810) (not e!169044))))

(declare-fun lt!380202 () (_ BitVec 64))

(declare-fun lt!380199 () (_ BitVec 64))

(declare-fun lt!380201 () (_ BitVec 64))

(assert (=> d!81886 (= res!203810 (= lt!380202 (bvsub lt!380201 lt!380199)))))

(assert (=> d!81886 (or (= (bvand lt!380201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380201 lt!380199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81886 (= lt!380199 (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379626)))) ((_ sign_extend 32) (currentByte!11697 (_1!11370 lt!379626))) ((_ sign_extend 32) (currentBit!11692 (_1!11370 lt!379626)))))))

(declare-fun lt!380200 () (_ BitVec 64))

(declare-fun lt!380203 () (_ BitVec 64))

(assert (=> d!81886 (= lt!380201 (bvmul lt!380200 lt!380203))))

(assert (=> d!81886 (or (= lt!380200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380203 (bvsdiv (bvmul lt!380200 lt!380203) lt!380200)))))

(assert (=> d!81886 (= lt!380203 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81886 (= lt!380200 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379626)))))))

(assert (=> d!81886 (= lt!380202 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11697 (_1!11370 lt!379626))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11692 (_1!11370 lt!379626)))))))

(assert (=> d!81886 (invariant!0 (currentBit!11692 (_1!11370 lt!379626)) (currentByte!11697 (_1!11370 lt!379626)) (size!5856 (buf!6325 (_1!11370 lt!379626))))))

(assert (=> d!81886 (= (bitIndex!0 (size!5856 (buf!6325 (_1!11370 lt!379626))) (currentByte!11697 (_1!11370 lt!379626)) (currentBit!11692 (_1!11370 lt!379626))) lt!380202)))

(declare-fun b!243907 () Bool)

(declare-fun res!203809 () Bool)

(assert (=> b!243907 (=> (not res!203809) (not e!169044))))

(assert (=> b!243907 (= res!203809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380202))))

(declare-fun b!243908 () Bool)

(declare-fun lt!380198 () (_ BitVec 64))

(assert (=> b!243908 (= e!169044 (bvsle lt!380202 (bvmul lt!380198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243908 (or (= lt!380198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380198)))))

(assert (=> b!243908 (= lt!380198 ((_ sign_extend 32) (size!5856 (buf!6325 (_1!11370 lt!379626)))))))

(assert (= (and d!81886 res!203810) b!243907))

(assert (= (and b!243907 res!203809) b!243908))

(declare-fun m!367605 () Bool)

(assert (=> d!81886 m!367605))

(declare-fun m!367607 () Bool)

(assert (=> d!81886 m!367607))

(assert (=> b!243654 d!81886))

(declare-fun d!81888 () Bool)

(assert (=> d!81888 (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380204 () Unit!17801)

(assert (=> d!81888 (= lt!380204 (choose!9 thiss!1005 (buf!6325 (_2!11368 lt!379635)) (bvsub nBits!297 from!289) (BitStream!10635 (buf!6325 (_2!11368 lt!379635)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005))))))

(assert (=> d!81888 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6325 (_2!11368 lt!379635)) (bvsub nBits!297 from!289)) lt!380204)))

(declare-fun bs!20711 () Bool)

(assert (= bs!20711 d!81888))

(assert (=> bs!20711 m!367147))

(declare-fun m!367609 () Bool)

(assert (=> bs!20711 m!367609))

(assert (=> b!243654 d!81888))

(declare-fun d!81890 () Bool)

(declare-fun e!169045 () Bool)

(assert (=> d!81890 e!169045))

(declare-fun res!203812 () Bool)

(assert (=> d!81890 (=> (not res!203812) (not e!169045))))

(declare-fun lt!380209 () (_ BitVec 64))

(declare-fun lt!380206 () (_ BitVec 64))

(declare-fun lt!380208 () (_ BitVec 64))

(assert (=> d!81890 (= res!203812 (= lt!380209 (bvsub lt!380208 lt!380206)))))

(assert (=> d!81890 (or (= (bvand lt!380208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380208 lt!380206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81890 (= lt!380206 (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636)))))))

(declare-fun lt!380207 () (_ BitVec 64))

(declare-fun lt!380210 () (_ BitVec 64))

(assert (=> d!81890 (= lt!380208 (bvmul lt!380207 lt!380210))))

(assert (=> d!81890 (or (= lt!380207 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380210 (bvsdiv (bvmul lt!380207 lt!380210) lt!380207)))))

(assert (=> d!81890 (= lt!380210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81890 (= lt!380207 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(assert (=> d!81890 (= lt!380209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379636))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379636)))))))

(assert (=> d!81890 (invariant!0 (currentBit!11692 (_2!11368 lt!379636)) (currentByte!11697 (_2!11368 lt!379636)) (size!5856 (buf!6325 (_2!11368 lt!379636))))))

(assert (=> d!81890 (= (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636))) lt!380209)))

(declare-fun b!243909 () Bool)

(declare-fun res!203811 () Bool)

(assert (=> b!243909 (=> (not res!203811) (not e!169045))))

(assert (=> b!243909 (= res!203811 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380209))))

(declare-fun b!243910 () Bool)

(declare-fun lt!380205 () (_ BitVec 64))

(assert (=> b!243910 (= e!169045 (bvsle lt!380209 (bvmul lt!380205 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243910 (or (= lt!380205 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380205 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380205)))))

(assert (=> b!243910 (= lt!380205 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(assert (= (and d!81890 res!203812) b!243909))

(assert (= (and b!243909 res!203811) b!243910))

(assert (=> d!81890 m!367567))

(declare-fun m!367611 () Bool)

(assert (=> d!81890 m!367611))

(assert (=> b!243658 d!81890))

(declare-fun d!81892 () Bool)

(declare-fun e!169046 () Bool)

(assert (=> d!81892 e!169046))

(declare-fun res!203814 () Bool)

(assert (=> d!81892 (=> (not res!203814) (not e!169046))))

(declare-fun lt!380215 () (_ BitVec 64))

(declare-fun lt!380214 () (_ BitVec 64))

(declare-fun lt!380212 () (_ BitVec 64))

(assert (=> d!81892 (= res!203814 (= lt!380215 (bvsub lt!380214 lt!380212)))))

(assert (=> d!81892 (or (= (bvand lt!380214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380214 lt!380212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81892 (= lt!380212 (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005))))))

(declare-fun lt!380213 () (_ BitVec 64))

(declare-fun lt!380216 () (_ BitVec 64))

(assert (=> d!81892 (= lt!380214 (bvmul lt!380213 lt!380216))))

(assert (=> d!81892 (or (= lt!380213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380216 (bvsdiv (bvmul lt!380213 lt!380216) lt!380213)))))

(assert (=> d!81892 (= lt!380216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81892 (= lt!380213 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))))))

(assert (=> d!81892 (= lt!380215 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11697 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11692 thiss!1005))))))

(assert (=> d!81892 (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 thiss!1005)))))

(assert (=> d!81892 (= (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)) lt!380215)))

(declare-fun b!243911 () Bool)

(declare-fun res!203813 () Bool)

(assert (=> b!243911 (=> (not res!203813) (not e!169046))))

(assert (=> b!243911 (= res!203813 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380215))))

(declare-fun b!243912 () Bool)

(declare-fun lt!380211 () (_ BitVec 64))

(assert (=> b!243912 (= e!169046 (bvsle lt!380215 (bvmul lt!380211 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243912 (or (= lt!380211 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380211 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380211)))))

(assert (=> b!243912 (= lt!380211 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))))))

(assert (= (and d!81892 res!203814) b!243911))

(assert (= (and b!243911 res!203813) b!243912))

(declare-fun m!367613 () Bool)

(assert (=> d!81892 m!367613))

(declare-fun m!367615 () Bool)

(assert (=> d!81892 m!367615))

(assert (=> b!243658 d!81892))

(declare-fun d!81894 () Bool)

(assert (=> d!81894 (= (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379635)))) (and (bvsge (currentBit!11692 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11692 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11697 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379635)))) (and (= (currentBit!11692 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379635))))))))))

(assert (=> b!243657 d!81894))

(declare-fun d!81896 () Bool)

(assert (=> d!81896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 thiss!1005))) ((_ sign_extend 32) (currentByte!11697 thiss!1005)) ((_ sign_extend 32) (currentBit!11692 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20712 () Bool)

(assert (= bs!20712 d!81896))

(assert (=> bs!20712 m!367613))

(assert (=> b!243661 d!81896))

(declare-fun d!81898 () Bool)

(declare-fun res!203815 () Bool)

(declare-fun e!169048 () Bool)

(assert (=> d!81898 (=> (not res!203815) (not e!169048))))

(assert (=> d!81898 (= res!203815 (= (size!5856 (buf!6325 thiss!1005)) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(assert (=> d!81898 (= (isPrefixOf!0 thiss!1005 (_2!11368 lt!379636)) e!169048)))

(declare-fun b!243913 () Bool)

(declare-fun res!203817 () Bool)

(assert (=> b!243913 (=> (not res!203817) (not e!169048))))

(assert (=> b!243913 (= res!203817 (bvsle (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)) (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379636))) (currentByte!11697 (_2!11368 lt!379636)) (currentBit!11692 (_2!11368 lt!379636)))))))

(declare-fun b!243914 () Bool)

(declare-fun e!169047 () Bool)

(assert (=> b!243914 (= e!169048 e!169047)))

(declare-fun res!203816 () Bool)

(assert (=> b!243914 (=> res!203816 e!169047)))

(assert (=> b!243914 (= res!203816 (= (size!5856 (buf!6325 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!243915 () Bool)

(assert (=> b!243915 (= e!169047 (arrayBitRangesEq!0 (buf!6325 thiss!1005) (buf!6325 (_2!11368 lt!379636)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5856 (buf!6325 thiss!1005)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005))))))

(assert (= (and d!81898 res!203815) b!243913))

(assert (= (and b!243913 res!203817) b!243914))

(assert (= (and b!243914 (not res!203816)) b!243915))

(assert (=> b!243913 m!367129))

(assert (=> b!243913 m!367117))

(assert (=> b!243915 m!367129))

(assert (=> b!243915 m!367129))

(declare-fun m!367617 () Bool)

(assert (=> b!243915 m!367617))

(assert (=> b!243660 d!81898))

(declare-fun d!81900 () Bool)

(assert (=> d!81900 (= (array_inv!5597 (buf!6325 thiss!1005)) (bvsge (size!5856 (buf!6325 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!243659 d!81900))

(declare-fun d!81902 () Bool)

(assert (=> d!81902 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 thiss!1005))))))

(declare-fun bs!20713 () Bool)

(assert (= bs!20713 d!81902))

(assert (=> bs!20713 m!367615))

(assert (=> start!52644 d!81902))

(declare-fun d!81904 () Bool)

(declare-fun e!169049 () Bool)

(assert (=> d!81904 e!169049))

(declare-fun res!203819 () Bool)

(assert (=> d!81904 (=> (not res!203819) (not e!169049))))

(declare-fun lt!380218 () (_ BitVec 64))

(declare-fun lt!380220 () (_ BitVec 64))

(declare-fun lt!380221 () (_ BitVec 64))

(assert (=> d!81904 (= res!203819 (= lt!380221 (bvsub lt!380220 lt!380218)))))

(assert (=> d!81904 (or (= (bvand lt!380220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!380218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!380220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!380220 lt!380218) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81904 (= lt!380218 (remainingBits!0 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))) ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379635))) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379635)))))))

(declare-fun lt!380219 () (_ BitVec 64))

(declare-fun lt!380222 () (_ BitVec 64))

(assert (=> d!81904 (= lt!380220 (bvmul lt!380219 lt!380222))))

(assert (=> d!81904 (or (= lt!380219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!380222 (bvsdiv (bvmul lt!380219 lt!380222) lt!380219)))))

(assert (=> d!81904 (= lt!380222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81904 (= lt!380219 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))))))

(assert (=> d!81904 (= lt!380221 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11697 (_2!11368 lt!379635))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11692 (_2!11368 lt!379635)))))))

(assert (=> d!81904 (invariant!0 (currentBit!11692 (_2!11368 lt!379635)) (currentByte!11697 (_2!11368 lt!379635)) (size!5856 (buf!6325 (_2!11368 lt!379635))))))

(assert (=> d!81904 (= (bitIndex!0 (size!5856 (buf!6325 (_2!11368 lt!379635))) (currentByte!11697 (_2!11368 lt!379635)) (currentBit!11692 (_2!11368 lt!379635))) lt!380221)))

(declare-fun b!243916 () Bool)

(declare-fun res!203818 () Bool)

(assert (=> b!243916 (=> (not res!203818) (not e!169049))))

(assert (=> b!243916 (= res!203818 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!380221))))

(declare-fun b!243917 () Bool)

(declare-fun lt!380217 () (_ BitVec 64))

(assert (=> b!243917 (= e!169049 (bvsle lt!380221 (bvmul lt!380217 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!243917 (or (= lt!380217 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!380217 #b0000000000000000000000000000000000000000000000000000000000001000) lt!380217)))))

(assert (=> b!243917 (= lt!380217 ((_ sign_extend 32) (size!5856 (buf!6325 (_2!11368 lt!379635)))))))

(assert (= (and d!81904 res!203819) b!243916))

(assert (= (and b!243916 res!203818) b!243917))

(declare-fun m!367619 () Bool)

(assert (=> d!81904 m!367619))

(declare-fun m!367621 () Bool)

(assert (=> d!81904 m!367621))

(assert (=> b!243653 d!81904))

(assert (=> b!243653 d!81890))

(declare-fun d!81906 () Bool)

(declare-fun lt!380223 () tuple2!20902)

(assert (=> d!81906 (= lt!380223 (readBit!0 (readerFrom!0 (_2!11368 lt!379636) (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005))))))

(assert (=> d!81906 (= (readBitPure!0 (readerFrom!0 (_2!11368 lt!379636) (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005))) (tuple2!20897 (_2!11373 lt!380223) (_1!11373 lt!380223)))))

(declare-fun bs!20714 () Bool)

(assert (= bs!20714 d!81906))

(assert (=> bs!20714 m!367133))

(declare-fun m!367623 () Bool)

(assert (=> bs!20714 m!367623))

(assert (=> b!243664 d!81906))

(declare-fun d!81908 () Bool)

(declare-fun e!169052 () Bool)

(assert (=> d!81908 e!169052))

(declare-fun res!203823 () Bool)

(assert (=> d!81908 (=> (not res!203823) (not e!169052))))

(assert (=> d!81908 (= res!203823 (invariant!0 (currentBit!11692 (_2!11368 lt!379636)) (currentByte!11697 (_2!11368 lt!379636)) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(assert (=> d!81908 (= (readerFrom!0 (_2!11368 lt!379636) (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005)) (BitStream!10635 (buf!6325 (_2!11368 lt!379636)) (currentByte!11697 thiss!1005) (currentBit!11692 thiss!1005)))))

(declare-fun b!243920 () Bool)

(assert (=> b!243920 (= e!169052 (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379636)))))))

(assert (= (and d!81908 res!203823) b!243920))

(assert (=> d!81908 m!367611))

(assert (=> b!243920 m!367139))

(assert (=> b!243664 d!81908))

(declare-fun d!81910 () Bool)

(assert (=> d!81910 (= (invariant!0 (currentBit!11692 thiss!1005) (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379636)))) (and (bvsge (currentBit!11692 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11692 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11697 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379636)))) (and (= (currentBit!11692 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11697 thiss!1005) (size!5856 (buf!6325 (_2!11368 lt!379636))))))))))

(assert (=> b!243652 d!81910))

(push 1)

(assert (not d!81864))

(assert (not d!81890))

(assert (not d!81886))

(assert (not d!81884))

(assert (not d!81888))

(assert (not d!81882))

(assert (not b!243900))

(assert (not d!81896))

(assert (not d!81904))

(assert (not d!81870))

(assert (not b!243883))

(assert (not b!243882))

(assert (not d!81878))

(assert (not b!243920))

(assert (not d!81860))

(assert (not d!81848))

(assert (not b!243895))

(assert (not d!81852))

(assert (not d!81880))

(assert (not b!243894))

(assert (not b!243896))

(assert (not b!243859))

(assert (not b!243913))

(assert (not b!243866))

(assert (not d!81866))

(assert (not b!243897))

(assert (not b!243906))

(assert (not b!243884))

(assert (not b!243870))

(assert (not b!243842))

(assert (not d!81850))

(assert (not d!81906))

(assert (not b!243857))

(assert (not b!243855))

(assert (not d!81856))

(assert (not d!81854))

(assert (not d!81868))

(assert (not b!243868))

(assert (not b!243869))

(assert (not b!243915))

(assert (not d!81872))

(assert (not b!243858))

(assert (not b!243844))

(assert (not d!81908))

(assert (not b!243881))

(assert (not d!81862))

(assert (not d!81892))

(assert (not d!81858))

(assert (not b!243898))

(assert (not d!81876))

(assert (not d!81902))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


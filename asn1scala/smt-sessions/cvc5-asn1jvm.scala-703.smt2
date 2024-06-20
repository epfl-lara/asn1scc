; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19698 () Bool)

(assert start!19698)

(declare-fun b!98399 () Bool)

(declare-fun res!80723 () Bool)

(declare-fun e!64373 () Bool)

(assert (=> b!98399 (=> (not res!80723) (not e!64373))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98399 (= res!80723 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!80725 () Bool)

(assert (=> start!19698 (=> (not res!80725) (not e!64373))))

(assert (=> start!19698 (= res!80725 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19698 e!64373))

(assert (=> start!19698 true))

(declare-datatypes ((array!4618 0))(
  ( (array!4619 (arr!2703 (Array (_ BitVec 32) (_ BitVec 8))) (size!2110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3694 0))(
  ( (BitStream!3695 (buf!2461 array!4618) (currentByte!4891 (_ BitVec 32)) (currentBit!4886 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3694)

(declare-fun e!64374 () Bool)

(declare-fun inv!12 (BitStream!3694) Bool)

(assert (=> start!19698 (and (inv!12 thiss!1288) e!64374)))

(declare-fun b!98400 () Bool)

(declare-fun res!80724 () Bool)

(declare-fun e!64371 () Bool)

(assert (=> b!98400 (=> res!80724 e!64371)))

(declare-datatypes ((Unit!6029 0))(
  ( (Unit!6030) )
))
(declare-datatypes ((tuple2!7936 0))(
  ( (tuple2!7937 (_1!4220 Unit!6029) (_2!4220 BitStream!3694)) )
))
(declare-fun lt!142591 () tuple2!7936)

(declare-fun isPrefixOf!0 (BitStream!3694 BitStream!3694) Bool)

(assert (=> b!98400 (= res!80724 (not (isPrefixOf!0 thiss!1288 (_2!4220 lt!142591))))))

(declare-fun b!98401 () Bool)

(declare-datatypes ((tuple2!7938 0))(
  ( (tuple2!7939 (_1!4221 BitStream!3694) (_2!4221 (_ BitVec 64))) )
))
(declare-fun lt!142588 () tuple2!7938)

(declare-datatypes ((tuple2!7940 0))(
  ( (tuple2!7941 (_1!4222 BitStream!3694) (_2!4222 BitStream!3694)) )
))
(declare-fun lt!142590 () tuple2!7940)

(assert (=> b!98401 (= e!64371 (or (not (= (_2!4221 lt!142588) v!196)) (not (= (_1!4221 lt!142588) (_2!4222 lt!142590)))))))

(declare-fun readNLeastSignificantBitsPure!0 (BitStream!3694 (_ BitVec 32)) tuple2!7938)

(assert (=> b!98401 (= lt!142588 (readNLeastSignificantBitsPure!0 (_1!4222 lt!142590) nBits!388))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98401 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!142589 () Unit!6029)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3694 array!4618 (_ BitVec 64)) Unit!6029)

(assert (=> b!98401 (= lt!142589 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2461 (_2!4220 lt!142591)) ((_ sign_extend 32) nBits!388)))))

(declare-fun reader!0 (BitStream!3694 BitStream!3694) tuple2!7940)

(assert (=> b!98401 (= lt!142590 (reader!0 thiss!1288 (_2!4220 lt!142591)))))

(declare-fun b!98402 () Bool)

(declare-fun array_inv!1912 (array!4618) Bool)

(assert (=> b!98402 (= e!64374 (array_inv!1912 (buf!2461 thiss!1288)))))

(declare-fun b!98403 () Bool)

(declare-fun res!80722 () Bool)

(assert (=> b!98403 (=> (not res!80722) (not e!64373))))

(assert (=> b!98403 (= res!80722 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98404 () Bool)

(assert (=> b!98404 (= e!64373 e!64371)))

(declare-fun res!80721 () Bool)

(assert (=> b!98404 (=> res!80721 e!64371)))

(assert (=> b!98404 (= res!80721 (not (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142591))))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7936)

(assert (=> b!98404 (= lt!142591 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98405 () Bool)

(declare-fun res!80726 () Bool)

(assert (=> b!98405 (=> res!80726 e!64371)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98405 (= res!80726 (not (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591))) (bvadd (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388)))))))

(assert (= (and start!19698 res!80725) b!98403))

(assert (= (and b!98403 res!80722) b!98399))

(assert (= (and b!98399 res!80723) b!98404))

(assert (= (and b!98404 (not res!80721)) b!98405))

(assert (= (and b!98405 (not res!80726)) b!98400))

(assert (= (and b!98400 (not res!80724)) b!98401))

(assert (= start!19698 b!98402))

(declare-fun m!142921 () Bool)

(assert (=> b!98399 m!142921))

(declare-fun m!142923 () Bool)

(assert (=> b!98403 m!142923))

(declare-fun m!142925 () Bool)

(assert (=> b!98400 m!142925))

(declare-fun m!142927 () Bool)

(assert (=> b!98401 m!142927))

(declare-fun m!142929 () Bool)

(assert (=> b!98401 m!142929))

(declare-fun m!142931 () Bool)

(assert (=> b!98401 m!142931))

(declare-fun m!142933 () Bool)

(assert (=> b!98401 m!142933))

(declare-fun m!142935 () Bool)

(assert (=> b!98402 m!142935))

(declare-fun m!142937 () Bool)

(assert (=> b!98404 m!142937))

(declare-fun m!142939 () Bool)

(assert (=> start!19698 m!142939))

(declare-fun m!142941 () Bool)

(assert (=> b!98405 m!142941))

(declare-fun m!142943 () Bool)

(assert (=> b!98405 m!142943))

(push 1)

(assert (not b!98403))

(assert (not b!98402))

(assert (not b!98401))

(assert (not b!98404))

(assert (not b!98399))

(assert (not b!98400))

(assert (not start!19698))

(assert (not b!98405))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30802 () Bool)

(assert (=> d!30802 (= (array_inv!1912 (buf!2461 thiss!1288)) (bvsge (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!98402 d!30802))

(declare-fun b!98503 () Bool)

(declare-fun e!64430 () (_ BitVec 64))

(assert (=> b!98503 (= e!64430 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!98504 () Bool)

(declare-fun e!64432 () Bool)

(declare-datatypes ((tuple2!7954 0))(
  ( (tuple2!7955 (_1!4229 BitStream!3694) (_2!4229 Bool)) )
))
(declare-fun lt!142815 () tuple2!7954)

(declare-fun lt!142811 () tuple2!7954)

(assert (=> b!98504 (= e!64432 (= (_2!4229 lt!142815) (_2!4229 lt!142811)))))

(declare-fun d!30804 () Bool)

(declare-fun e!64433 () Bool)

(assert (=> d!30804 e!64433))

(declare-fun res!80800 () Bool)

(assert (=> d!30804 (=> (not res!80800) (not e!64433))))

(declare-fun lt!142835 () tuple2!7936)

(assert (=> d!30804 (= res!80800 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142835)))))))

(declare-fun e!64431 () tuple2!7936)

(assert (=> d!30804 (= lt!142835 e!64431)))

(declare-fun c!6226 () Bool)

(assert (=> d!30804 (= c!6226 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30804 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30804 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!142835)))

(declare-fun b!98505 () Bool)

(declare-fun res!80807 () Bool)

(assert (=> b!98505 (=> (not res!80807) (not e!64433))))

(declare-fun lt!142845 () (_ BitVec 64))

(declare-fun lt!142843 () (_ BitVec 64))

(assert (=> b!98505 (= res!80807 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142835))) (currentByte!4891 (_2!4220 lt!142835)) (currentBit!4886 (_2!4220 lt!142835))) (bvadd lt!142843 lt!142845)))))

(assert (=> b!98505 (or (not (= (bvand lt!142843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142845 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!142843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!142843 lt!142845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98505 (= lt!142845 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98505 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98505 (= lt!142843 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(declare-fun b!98506 () Bool)

(declare-fun res!80808 () Bool)

(declare-fun lt!142827 () tuple2!7936)

(assert (=> b!98506 (= res!80808 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142827))) (currentByte!4891 (_2!4220 lt!142827)) (currentBit!4886 (_2!4220 lt!142827))) (bvadd (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!64427 () Bool)

(assert (=> b!98506 (=> (not res!80808) (not e!64427))))

(declare-fun b!98507 () Bool)

(declare-fun lt!142819 () tuple2!7936)

(declare-fun Unit!6035 () Unit!6029)

(assert (=> b!98507 (= e!64431 (tuple2!7937 Unit!6035 (_2!4220 lt!142819)))))

(declare-fun lt!142832 () Bool)

(assert (=> b!98507 (= lt!142832 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3694 Bool) tuple2!7936)

(assert (=> b!98507 (= lt!142827 (appendBit!0 thiss!1288 lt!142832))))

(declare-fun res!80804 () Bool)

(assert (=> b!98507 (= res!80804 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142827)))))))

(assert (=> b!98507 (=> (not res!80804) (not e!64427))))

(assert (=> b!98507 e!64427))

(declare-fun lt!142834 () tuple2!7936)

(assert (=> b!98507 (= lt!142834 lt!142827)))

(assert (=> b!98507 (= lt!142819 (appendNLeastSignificantBitsLoop!0 (_2!4220 lt!142834) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!142842 () Unit!6029)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3694 BitStream!3694 BitStream!3694) Unit!6029)

(assert (=> b!98507 (= lt!142842 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4220 lt!142834) (_2!4220 lt!142819)))))

(declare-fun call!1225 () Bool)

(assert (=> b!98507 call!1225))

(declare-fun lt!142830 () Unit!6029)

(assert (=> b!98507 (= lt!142830 lt!142842)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!98507 (invariant!0 (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288) (size!2110 (buf!2461 (_2!4220 lt!142834))))))

(declare-fun lt!142839 () BitStream!3694)

(assert (=> b!98507 (= lt!142839 (BitStream!3695 (buf!2461 (_2!4220 lt!142834)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (=> b!98507 (invariant!0 (currentBit!4886 lt!142839) (currentByte!4891 lt!142839) (size!2110 (buf!2461 (_2!4220 lt!142819))))))

(declare-fun lt!142820 () BitStream!3694)

(assert (=> b!98507 (= lt!142820 (BitStream!3695 (buf!2461 (_2!4220 lt!142819)) (currentByte!4891 lt!142839) (currentBit!4886 lt!142839)))))

(declare-fun readBitPure!0 (BitStream!3694) tuple2!7954)

(assert (=> b!98507 (= lt!142815 (readBitPure!0 lt!142839))))

(assert (=> b!98507 (= lt!142811 (readBitPure!0 lt!142820))))

(declare-fun lt!142847 () Unit!6029)

(declare-fun readBitPrefixLemma!0 (BitStream!3694 BitStream!3694) Unit!6029)

(assert (=> b!98507 (= lt!142847 (readBitPrefixLemma!0 lt!142839 (_2!4220 lt!142819)))))

(declare-fun res!80805 () Bool)

(assert (=> b!98507 (= res!80805 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!142815))) (currentByte!4891 (_1!4229 lt!142815)) (currentBit!4886 (_1!4229 lt!142815))) (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!142811))) (currentByte!4891 (_1!4229 lt!142811)) (currentBit!4886 (_1!4229 lt!142811)))))))

(assert (=> b!98507 (=> (not res!80805) (not e!64432))))

(assert (=> b!98507 e!64432))

(declare-fun lt!142850 () Unit!6029)

(assert (=> b!98507 (= lt!142850 lt!142847)))

(declare-fun lt!142824 () tuple2!7940)

(assert (=> b!98507 (= lt!142824 (reader!0 thiss!1288 (_2!4220 lt!142819)))))

(declare-fun lt!142833 () tuple2!7940)

(assert (=> b!98507 (= lt!142833 (reader!0 (_2!4220 lt!142834) (_2!4220 lt!142819)))))

(declare-fun lt!142844 () tuple2!7954)

(assert (=> b!98507 (= lt!142844 (readBitPure!0 (_1!4222 lt!142824)))))

(assert (=> b!98507 (= (_2!4229 lt!142844) lt!142832)))

(declare-fun lt!142822 () Unit!6029)

(declare-fun Unit!6036 () Unit!6029)

(assert (=> b!98507 (= lt!142822 Unit!6036)))

(declare-fun lt!142816 () (_ BitVec 64))

(assert (=> b!98507 (= lt!142816 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!142818 () (_ BitVec 64))

(assert (=> b!98507 (= lt!142818 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!142823 () Unit!6029)

(assert (=> b!98507 (= lt!142823 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2461 (_2!4220 lt!142819)) lt!142818))))

(assert (=> b!98507 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142818)))

(declare-fun lt!142837 () Unit!6029)

(assert (=> b!98507 (= lt!142837 lt!142823)))

(declare-fun lt!142817 () tuple2!7938)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7938)

(assert (=> b!98507 (= lt!142817 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816))))

(declare-fun lt!142814 () (_ BitVec 64))

(assert (=> b!98507 (= lt!142814 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!142808 () Unit!6029)

(assert (=> b!98507 (= lt!142808 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4220 lt!142834) (buf!2461 (_2!4220 lt!142819)) lt!142814))))

(assert (=> b!98507 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834))) lt!142814)))

(declare-fun lt!142852 () Unit!6029)

(assert (=> b!98507 (= lt!142852 lt!142808)))

(declare-fun lt!142829 () tuple2!7938)

(assert (=> b!98507 (= lt!142829 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142833) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142816 (ite (_2!4229 lt!142844) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!142821 () tuple2!7938)

(assert (=> b!98507 (= lt!142821 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816))))

(declare-fun c!6225 () Bool)

(assert (=> b!98507 (= c!6225 (_2!4229 (readBitPure!0 (_1!4222 lt!142824))))))

(declare-fun lt!142851 () tuple2!7938)

(declare-fun withMovedBitIndex!0 (BitStream!3694 (_ BitVec 64)) BitStream!3694)

(assert (=> b!98507 (= lt!142851 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142816 e!64430)))))

(declare-fun lt!142809 () Unit!6029)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6029)

(assert (=> b!98507 (= lt!142809 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816))))

(assert (=> b!98507 (and (= (_2!4221 lt!142821) (_2!4221 lt!142851)) (= (_1!4221 lt!142821) (_1!4221 lt!142851)))))

(declare-fun lt!142840 () Unit!6029)

(assert (=> b!98507 (= lt!142840 lt!142809)))

(assert (=> b!98507 (= (_1!4222 lt!142824) (withMovedBitIndex!0 (_2!4222 lt!142824) (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))))))

(declare-fun lt!142825 () Unit!6029)

(declare-fun Unit!6037 () Unit!6029)

(assert (=> b!98507 (= lt!142825 Unit!6037)))

(assert (=> b!98507 (= (_1!4222 lt!142833) (withMovedBitIndex!0 (_2!4222 lt!142833) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))))))

(declare-fun lt!142812 () Unit!6029)

(declare-fun Unit!6038 () Unit!6029)

(assert (=> b!98507 (= lt!142812 Unit!6038)))

(assert (=> b!98507 (= (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!142838 () Unit!6029)

(declare-fun Unit!6039 () Unit!6029)

(assert (=> b!98507 (= lt!142838 Unit!6039)))

(assert (=> b!98507 (= (_2!4221 lt!142817) (_2!4221 lt!142829))))

(declare-fun lt!142826 () Unit!6029)

(declare-fun Unit!6040 () Unit!6029)

(assert (=> b!98507 (= lt!142826 Unit!6040)))

(assert (=> b!98507 (= (_1!4221 lt!142817) (_2!4222 lt!142824))))

(declare-fun b!98508 () Bool)

(declare-fun lt!142836 () Unit!6029)

(assert (=> b!98508 (= e!64431 (tuple2!7937 lt!142836 thiss!1288))))

(declare-fun lt!142831 () BitStream!3694)

(assert (=> b!98508 (= lt!142831 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3694) Unit!6029)

(assert (=> b!98508 (= lt!142836 (lemmaIsPrefixRefl!0 lt!142831))))

(assert (=> b!98508 call!1225))

(declare-fun b!98509 () Bool)

(declare-fun e!64429 () Bool)

(declare-fun lt!142849 () (_ BitVec 64))

(assert (=> b!98509 (= e!64429 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142849))))

(declare-fun b!98510 () Bool)

(declare-fun e!64428 () Bool)

(declare-fun lt!142848 () tuple2!7954)

(assert (=> b!98510 (= e!64428 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!142848))) (currentByte!4891 (_1!4229 lt!142848)) (currentBit!4886 (_1!4229 lt!142848))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142827))) (currentByte!4891 (_2!4220 lt!142827)) (currentBit!4886 (_2!4220 lt!142827)))))))

(declare-fun b!98511 () Bool)

(assert (=> b!98511 (= e!64430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1222 () Bool)

(assert (=> bm!1222 (= call!1225 (isPrefixOf!0 (ite c!6226 thiss!1288 lt!142831) (ite c!6226 (_2!4220 lt!142819) lt!142831)))))

(declare-fun b!98512 () Bool)

(declare-fun readerFrom!0 (BitStream!3694 (_ BitVec 32) (_ BitVec 32)) BitStream!3694)

(assert (=> b!98512 (= lt!142848 (readBitPure!0 (readerFrom!0 (_2!4220 lt!142827) (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288))))))

(declare-fun res!80802 () Bool)

(assert (=> b!98512 (= res!80802 (and (= (_2!4229 lt!142848) lt!142832) (= (_1!4229 lt!142848) (_2!4220 lt!142827))))))

(assert (=> b!98512 (=> (not res!80802) (not e!64428))))

(assert (=> b!98512 (= e!64427 e!64428)))

(declare-fun b!98513 () Bool)

(declare-fun res!80806 () Bool)

(assert (=> b!98513 (= res!80806 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142827)))))

(assert (=> b!98513 (=> (not res!80806) (not e!64427))))

(declare-fun b!98514 () Bool)

(declare-fun res!80803 () Bool)

(assert (=> b!98514 (=> (not res!80803) (not e!64433))))

(assert (=> b!98514 (= res!80803 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142835)))))

(declare-fun lt!142841 () tuple2!7938)

(declare-fun b!98515 () Bool)

(declare-fun lt!142846 () tuple2!7940)

(assert (=> b!98515 (= e!64433 (and (= (_2!4221 lt!142841) v!196) (= (_1!4221 lt!142841) (_2!4222 lt!142846))))))

(declare-fun lt!142810 () (_ BitVec 64))

(assert (=> b!98515 (= lt!142841 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142846) nBits!388 #b00000000000000000000000000000000 lt!142810))))

(declare-fun lt!142813 () Unit!6029)

(declare-fun lt!142828 () Unit!6029)

(assert (=> b!98515 (= lt!142813 lt!142828)))

(assert (=> b!98515 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142849)))

(assert (=> b!98515 (= lt!142828 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2461 (_2!4220 lt!142835)) lt!142849))))

(assert (=> b!98515 e!64429))

(declare-fun res!80801 () Bool)

(assert (=> b!98515 (=> (not res!80801) (not e!64429))))

(assert (=> b!98515 (= res!80801 (and (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142835)))) (bvsge lt!142849 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98515 (= lt!142849 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98515 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98515 (= lt!142810 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98515 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98515 (= lt!142846 (reader!0 thiss!1288 (_2!4220 lt!142835)))))

(assert (= (and d!30804 c!6226) b!98507))

(assert (= (and d!30804 (not c!6226)) b!98508))

(assert (= (and b!98507 res!80804) b!98506))

(assert (= (and b!98506 res!80808) b!98513))

(assert (= (and b!98513 res!80806) b!98512))

(assert (= (and b!98512 res!80802) b!98510))

(assert (= (and b!98507 res!80805) b!98504))

(assert (= (and b!98507 c!6225) b!98503))

(assert (= (and b!98507 (not c!6225)) b!98511))

(assert (= (or b!98507 b!98508) bm!1222))

(assert (= (and d!30804 res!80800) b!98505))

(assert (= (and b!98505 res!80807) b!98514))

(assert (= (and b!98514 res!80803) b!98515))

(assert (= (and b!98515 res!80801) b!98509))

(declare-fun m!143033 () Bool)

(assert (=> b!98512 m!143033))

(assert (=> b!98512 m!143033))

(declare-fun m!143035 () Bool)

(assert (=> b!98512 m!143035))

(declare-fun m!143037 () Bool)

(assert (=> b!98508 m!143037))

(declare-fun m!143039 () Bool)

(assert (=> b!98507 m!143039))

(declare-fun m!143041 () Bool)

(assert (=> b!98507 m!143041))

(declare-fun m!143043 () Bool)

(assert (=> b!98507 m!143043))

(declare-fun m!143045 () Bool)

(assert (=> b!98507 m!143045))

(declare-fun m!143047 () Bool)

(assert (=> b!98507 m!143047))

(declare-fun m!143049 () Bool)

(assert (=> b!98507 m!143049))

(declare-fun m!143051 () Bool)

(assert (=> b!98507 m!143051))

(declare-fun m!143053 () Bool)

(assert (=> b!98507 m!143053))

(declare-fun m!143055 () Bool)

(assert (=> b!98507 m!143055))

(declare-fun m!143057 () Bool)

(assert (=> b!98507 m!143057))

(assert (=> b!98507 m!142943))

(declare-fun m!143059 () Bool)

(assert (=> b!98507 m!143059))

(declare-fun m!143061 () Bool)

(assert (=> b!98507 m!143061))

(declare-fun m!143063 () Bool)

(assert (=> b!98507 m!143063))

(declare-fun m!143065 () Bool)

(assert (=> b!98507 m!143065))

(declare-fun m!143067 () Bool)

(assert (=> b!98507 m!143067))

(declare-fun m!143069 () Bool)

(assert (=> b!98507 m!143069))

(declare-fun m!143071 () Bool)

(assert (=> b!98507 m!143071))

(declare-fun m!143073 () Bool)

(assert (=> b!98507 m!143073))

(declare-fun m!143075 () Bool)

(assert (=> b!98507 m!143075))

(declare-fun m!143077 () Bool)

(assert (=> b!98507 m!143077))

(declare-fun m!143079 () Bool)

(assert (=> b!98507 m!143079))

(declare-fun m!143081 () Bool)

(assert (=> b!98507 m!143081))

(declare-fun m!143083 () Bool)

(assert (=> b!98507 m!143083))

(declare-fun m!143085 () Bool)

(assert (=> b!98507 m!143085))

(declare-fun m!143087 () Bool)

(assert (=> b!98507 m!143087))

(declare-fun m!143089 () Bool)

(assert (=> b!98507 m!143089))

(assert (=> b!98507 m!143065))

(declare-fun m!143091 () Bool)

(assert (=> b!98507 m!143091))

(declare-fun m!143093 () Bool)

(assert (=> b!98505 m!143093))

(assert (=> b!98505 m!142943))

(declare-fun m!143095 () Bool)

(assert (=> b!98509 m!143095))

(declare-fun m!143097 () Bool)

(assert (=> b!98510 m!143097))

(declare-fun m!143099 () Bool)

(assert (=> b!98510 m!143099))

(declare-fun m!143101 () Bool)

(assert (=> b!98514 m!143101))

(assert (=> b!98506 m!143099))

(assert (=> b!98506 m!142943))

(declare-fun m!143103 () Bool)

(assert (=> b!98515 m!143103))

(assert (=> b!98515 m!143049))

(declare-fun m!143105 () Bool)

(assert (=> b!98515 m!143105))

(declare-fun m!143107 () Bool)

(assert (=> b!98515 m!143107))

(declare-fun m!143109 () Bool)

(assert (=> b!98515 m!143109))

(declare-fun m!143111 () Bool)

(assert (=> bm!1222 m!143111))

(declare-fun m!143113 () Bool)

(assert (=> b!98513 m!143113))

(assert (=> b!98404 d!30804))

(declare-fun d!30816 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30816 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7552 () Bool)

(assert (= bs!7552 d!30816))

(declare-fun m!143115 () Bool)

(assert (=> bs!7552 m!143115))

(assert (=> b!98403 d!30816))

(declare-fun d!30818 () Bool)

(declare-fun e!64442 () Bool)

(assert (=> d!30818 e!64442))

(declare-fun res!80822 () Bool)

(assert (=> d!30818 (=> (not res!80822) (not e!64442))))

(declare-fun lt!142920 () (_ BitVec 64))

(declare-fun lt!142924 () (_ BitVec 64))

(declare-fun lt!142919 () (_ BitVec 64))

(assert (=> d!30818 (= res!80822 (= lt!142924 (bvsub lt!142919 lt!142920)))))

(assert (=> d!30818 (or (= (bvand lt!142919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142920 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142919 lt!142920) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30818 (= lt!142920 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142591))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142591)))))))

(declare-fun lt!142922 () (_ BitVec 64))

(declare-fun lt!142923 () (_ BitVec 64))

(assert (=> d!30818 (= lt!142919 (bvmul lt!142922 lt!142923))))

(assert (=> d!30818 (or (= lt!142922 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142923 (bvsdiv (bvmul lt!142922 lt!142923) lt!142922)))))

(assert (=> d!30818 (= lt!142923 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30818 (= lt!142922 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))))))

(assert (=> d!30818 (= lt!142924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142591)))))))

(assert (=> d!30818 (invariant!0 (currentBit!4886 (_2!4220 lt!142591)) (currentByte!4891 (_2!4220 lt!142591)) (size!2110 (buf!2461 (_2!4220 lt!142591))))))

(assert (=> d!30818 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591))) lt!142924)))

(declare-fun b!98532 () Bool)

(declare-fun res!80821 () Bool)

(assert (=> b!98532 (=> (not res!80821) (not e!64442))))

(assert (=> b!98532 (= res!80821 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142924))))

(declare-fun b!98533 () Bool)

(declare-fun lt!142921 () (_ BitVec 64))

(assert (=> b!98533 (= e!64442 (bvsle lt!142924 (bvmul lt!142921 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98533 (or (= lt!142921 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142921 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142921)))))

(assert (=> b!98533 (= lt!142921 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))))))

(assert (= (and d!30818 res!80822) b!98532))

(assert (= (and b!98532 res!80821) b!98533))

(declare-fun m!143117 () Bool)

(assert (=> d!30818 m!143117))

(declare-fun m!143119 () Bool)

(assert (=> d!30818 m!143119))

(assert (=> b!98405 d!30818))

(declare-fun d!30820 () Bool)

(declare-fun e!64443 () Bool)

(assert (=> d!30820 e!64443))

(declare-fun res!80824 () Bool)

(assert (=> d!30820 (=> (not res!80824) (not e!64443))))

(declare-fun lt!142926 () (_ BitVec 64))

(declare-fun lt!142930 () (_ BitVec 64))

(declare-fun lt!142925 () (_ BitVec 64))

(assert (=> d!30820 (= res!80824 (= lt!142930 (bvsub lt!142925 lt!142926)))))

(assert (=> d!30820 (or (= (bvand lt!142925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142925 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142925 lt!142926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30820 (= lt!142926 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))))))

(declare-fun lt!142928 () (_ BitVec 64))

(declare-fun lt!142929 () (_ BitVec 64))

(assert (=> d!30820 (= lt!142925 (bvmul lt!142928 lt!142929))))

(assert (=> d!30820 (or (= lt!142928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!142929 (bvsdiv (bvmul lt!142928 lt!142929) lt!142928)))))

(assert (=> d!30820 (= lt!142929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30820 (= lt!142928 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))))))

(assert (=> d!30820 (= lt!142930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 thiss!1288))))))

(assert (=> d!30820 (invariant!0 (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288) (size!2110 (buf!2461 thiss!1288)))))

(assert (=> d!30820 (= (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) lt!142930)))

(declare-fun b!98534 () Bool)

(declare-fun res!80823 () Bool)

(assert (=> b!98534 (=> (not res!80823) (not e!64443))))

(assert (=> b!98534 (= res!80823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142930))))

(declare-fun b!98535 () Bool)

(declare-fun lt!142927 () (_ BitVec 64))

(assert (=> b!98535 (= e!64443 (bvsle lt!142930 (bvmul lt!142927 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98535 (or (= lt!142927 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!142927 #b0000000000000000000000000000000000000000000000000000000000001000) lt!142927)))))

(assert (=> b!98535 (= lt!142927 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))))))

(assert (= (and d!30820 res!80824) b!98534))

(assert (= (and b!98534 res!80823) b!98535))

(assert (=> d!30820 m!143115))

(declare-fun m!143121 () Bool)

(assert (=> d!30820 m!143121))

(assert (=> b!98405 d!30820))

(declare-fun d!30822 () Bool)

(declare-fun res!80841 () Bool)

(declare-fun e!64455 () Bool)

(assert (=> d!30822 (=> (not res!80841) (not e!64455))))

(assert (=> d!30822 (= res!80841 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142591)))))))

(assert (=> d!30822 (= (isPrefixOf!0 thiss!1288 (_2!4220 lt!142591)) e!64455)))

(declare-fun b!98555 () Bool)

(declare-fun res!80840 () Bool)

(assert (=> b!98555 (=> (not res!80840) (not e!64455))))

(assert (=> b!98555 (= res!80840 (bvsle (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591)))))))

(declare-fun b!98556 () Bool)

(declare-fun e!64456 () Bool)

(assert (=> b!98556 (= e!64455 e!64456)))

(declare-fun res!80842 () Bool)

(assert (=> b!98556 (=> res!80842 e!64456)))

(assert (=> b!98556 (= res!80842 (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98557 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4618 array!4618 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98557 (= e!64456 (arrayBitRangesEq!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (= (and d!30822 res!80841) b!98555))

(assert (= (and b!98555 res!80840) b!98556))

(assert (= (and b!98556 (not res!80842)) b!98557))

(assert (=> b!98555 m!142943))

(assert (=> b!98555 m!142941))

(assert (=> b!98557 m!142943))

(assert (=> b!98557 m!142943))

(declare-fun m!143123 () Bool)

(assert (=> b!98557 m!143123))

(assert (=> b!98400 d!30822))

(declare-fun d!30824 () Bool)

(assert (=> d!30824 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!98399 d!30824))

(declare-fun d!30826 () Bool)

(declare-datatypes ((tuple2!7960 0))(
  ( (tuple2!7961 (_1!4232 (_ BitVec 64)) (_2!4232 BitStream!3694)) )
))
(declare-fun lt!142978 () tuple2!7960)

(declare-fun readNLeastSignificantBits!0 (BitStream!3694 (_ BitVec 32)) tuple2!7960)

(assert (=> d!30826 (= lt!142978 (readNLeastSignificantBits!0 (_1!4222 lt!142590) nBits!388))))

(assert (=> d!30826 (= (readNLeastSignificantBitsPure!0 (_1!4222 lt!142590) nBits!388) (tuple2!7939 (_2!4232 lt!142978) (_1!4232 lt!142978)))))

(declare-fun bs!7553 () Bool)

(assert (= bs!7553 d!30826))

(declare-fun m!143207 () Bool)

(assert (=> bs!7553 m!143207))

(assert (=> b!98401 d!30826))

(declare-fun d!30830 () Bool)

(assert (=> d!30830 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7554 () Bool)

(assert (= bs!7554 d!30830))

(declare-fun m!143209 () Bool)

(assert (=> bs!7554 m!143209))

(assert (=> b!98401 d!30830))

(declare-fun d!30832 () Bool)

(assert (=> d!30832 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!142981 () Unit!6029)

(declare-fun choose!9 (BitStream!3694 array!4618 (_ BitVec 64) BitStream!3694) Unit!6029)

(assert (=> d!30832 (= lt!142981 (choose!9 thiss!1288 (buf!2461 (_2!4220 lt!142591)) ((_ sign_extend 32) nBits!388) (BitStream!3695 (buf!2461 (_2!4220 lt!142591)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (=> d!30832 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2461 (_2!4220 lt!142591)) ((_ sign_extend 32) nBits!388)) lt!142981)))

(declare-fun bs!7555 () Bool)

(assert (= bs!7555 d!30832))

(assert (=> bs!7555 m!142929))

(declare-fun m!143211 () Bool)

(assert (=> bs!7555 m!143211))

(assert (=> b!98401 d!30832))

(declare-fun b!98589 () Bool)

(declare-fun e!64474 () Bool)

(declare-fun lt!143055 () (_ BitVec 64))

(declare-fun lt!143046 () tuple2!7940)

(declare-fun lt!143044 () (_ BitVec 64))

(assert (=> b!98589 (= e!64474 (= (_1!4222 lt!143046) (withMovedBitIndex!0 (_2!4222 lt!143046) (bvsub lt!143055 lt!143044))))))

(assert (=> b!98589 (or (= (bvand lt!143055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143044 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143055 lt!143044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98589 (= lt!143044 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591))))))

(assert (=> b!98589 (= lt!143055 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(declare-fun b!98590 () Bool)

(declare-fun res!80868 () Bool)

(assert (=> b!98590 (=> (not res!80868) (not e!64474))))

(assert (=> b!98590 (= res!80868 (isPrefixOf!0 (_2!4222 lt!143046) (_2!4220 lt!142591)))))

(declare-fun d!30834 () Bool)

(assert (=> d!30834 e!64474))

(declare-fun res!80867 () Bool)

(assert (=> d!30834 (=> (not res!80867) (not e!64474))))

(assert (=> d!30834 (= res!80867 (isPrefixOf!0 (_1!4222 lt!143046) (_2!4222 lt!143046)))))

(declare-fun lt!143050 () BitStream!3694)

(assert (=> d!30834 (= lt!143046 (tuple2!7941 lt!143050 (_2!4220 lt!142591)))))

(declare-fun lt!143045 () Unit!6029)

(declare-fun lt!143052 () Unit!6029)

(assert (=> d!30834 (= lt!143045 lt!143052)))

(assert (=> d!30834 (isPrefixOf!0 lt!143050 (_2!4220 lt!142591))))

(assert (=> d!30834 (= lt!143052 (lemmaIsPrefixTransitive!0 lt!143050 (_2!4220 lt!142591) (_2!4220 lt!142591)))))

(declare-fun lt!143054 () Unit!6029)

(declare-fun lt!143063 () Unit!6029)

(assert (=> d!30834 (= lt!143054 lt!143063)))

(assert (=> d!30834 (isPrefixOf!0 lt!143050 (_2!4220 lt!142591))))

(assert (=> d!30834 (= lt!143063 (lemmaIsPrefixTransitive!0 lt!143050 thiss!1288 (_2!4220 lt!142591)))))

(declare-fun lt!143047 () Unit!6029)

(declare-fun e!64473 () Unit!6029)

(assert (=> d!30834 (= lt!143047 e!64473)))

(declare-fun c!6235 () Bool)

(assert (=> d!30834 (= c!6235 (not (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143057 () Unit!6029)

(declare-fun lt!143048 () Unit!6029)

(assert (=> d!30834 (= lt!143057 lt!143048)))

(assert (=> d!30834 (isPrefixOf!0 (_2!4220 lt!142591) (_2!4220 lt!142591))))

(assert (=> d!30834 (= lt!143048 (lemmaIsPrefixRefl!0 (_2!4220 lt!142591)))))

(declare-fun lt!143059 () Unit!6029)

(declare-fun lt!143058 () Unit!6029)

(assert (=> d!30834 (= lt!143059 lt!143058)))

(assert (=> d!30834 (= lt!143058 (lemmaIsPrefixRefl!0 (_2!4220 lt!142591)))))

(declare-fun lt!143061 () Unit!6029)

(declare-fun lt!143053 () Unit!6029)

(assert (=> d!30834 (= lt!143061 lt!143053)))

(assert (=> d!30834 (isPrefixOf!0 lt!143050 lt!143050)))

(assert (=> d!30834 (= lt!143053 (lemmaIsPrefixRefl!0 lt!143050))))

(declare-fun lt!143062 () Unit!6029)

(declare-fun lt!143049 () Unit!6029)

(assert (=> d!30834 (= lt!143062 lt!143049)))

(assert (=> d!30834 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30834 (= lt!143049 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30834 (= lt!143050 (BitStream!3695 (buf!2461 (_2!4220 lt!142591)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (=> d!30834 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142591))))

(assert (=> d!30834 (= (reader!0 thiss!1288 (_2!4220 lt!142591)) lt!143046)))

(declare-fun b!98591 () Bool)

(declare-fun res!80866 () Bool)

(assert (=> b!98591 (=> (not res!80866) (not e!64474))))

(assert (=> b!98591 (= res!80866 (isPrefixOf!0 (_1!4222 lt!143046) thiss!1288))))

(declare-fun b!98592 () Bool)

(declare-fun Unit!6048 () Unit!6029)

(assert (=> b!98592 (= e!64473 Unit!6048)))

(declare-fun b!98593 () Bool)

(declare-fun lt!143060 () Unit!6029)

(assert (=> b!98593 (= e!64473 lt!143060)))

(declare-fun lt!143051 () (_ BitVec 64))

(assert (=> b!98593 (= lt!143051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143056 () (_ BitVec 64))

(assert (=> b!98593 (= lt!143056 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4618 array!4618 (_ BitVec 64) (_ BitVec 64)) Unit!6029)

(assert (=> b!98593 (= lt!143060 (arrayBitRangesEqSymmetric!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142591)) lt!143051 lt!143056))))

(assert (=> b!98593 (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142591)) (buf!2461 thiss!1288) lt!143051 lt!143056)))

(assert (= (and d!30834 c!6235) b!98593))

(assert (= (and d!30834 (not c!6235)) b!98592))

(assert (= (and d!30834 res!80867) b!98591))

(assert (= (and b!98591 res!80866) b!98590))

(assert (= (and b!98590 res!80868) b!98589))

(declare-fun m!143221 () Bool)

(assert (=> d!30834 m!143221))

(declare-fun m!143223 () Bool)

(assert (=> d!30834 m!143223))

(declare-fun m!143225 () Bool)

(assert (=> d!30834 m!143225))

(declare-fun m!143227 () Bool)

(assert (=> d!30834 m!143227))

(declare-fun m!143229 () Bool)

(assert (=> d!30834 m!143229))

(declare-fun m!143231 () Bool)

(assert (=> d!30834 m!143231))

(declare-fun m!143233 () Bool)

(assert (=> d!30834 m!143233))

(declare-fun m!143235 () Bool)

(assert (=> d!30834 m!143235))

(declare-fun m!143237 () Bool)

(assert (=> d!30834 m!143237))

(assert (=> d!30834 m!142925))

(declare-fun m!143239 () Bool)

(assert (=> d!30834 m!143239))

(declare-fun m!143241 () Bool)

(assert (=> b!98590 m!143241))

(declare-fun m!143243 () Bool)

(assert (=> b!98589 m!143243))

(assert (=> b!98589 m!142941))

(assert (=> b!98589 m!142943))

(assert (=> b!98593 m!142943))

(declare-fun m!143245 () Bool)

(assert (=> b!98593 m!143245))

(declare-fun m!143247 () Bool)

(assert (=> b!98593 m!143247))

(declare-fun m!143249 () Bool)

(assert (=> b!98591 m!143249))

(assert (=> b!98401 d!30834))

(declare-fun d!30844 () Bool)

(assert (=> d!30844 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288) (size!2110 (buf!2461 thiss!1288))))))

(declare-fun bs!7559 () Bool)

(assert (= bs!7559 d!30844))

(assert (=> bs!7559 m!143121))

(assert (=> start!19698 d!30844))

(push 1)

(assert (not b!98514))

(assert (not b!98512))

(assert (not b!98509))

(assert (not b!98505))

(assert (not b!98593))

(assert (not d!30826))

(assert (not d!30830))

(assert (not b!98507))

(assert (not d!30844))

(assert (not b!98590))

(assert (not b!98510))

(assert (not bm!1222))

(assert (not d!30832))

(assert (not b!98555))

(assert (not b!98589))

(assert (not d!30818))

(assert (not b!98557))

(assert (not d!30820))

(assert (not d!30834))

(assert (not b!98508))

(assert (not b!98513))

(assert (not b!98515))

(assert (not b!98506))

(assert (not d!30816))

(assert (not b!98591))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!98675 () Bool)

(declare-fun e!64522 () Bool)

(declare-datatypes ((tuple4!62 0))(
  ( (tuple4!63 (_1!4235 (_ BitVec 32)) (_2!4235 (_ BitVec 32)) (_3!252 (_ BitVec 32)) (_4!31 (_ BitVec 32))) )
))
(declare-fun lt!143299 () tuple4!62)

(declare-fun arrayRangesEq!32 (array!4618 array!4618 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!98675 (= e!64522 (arrayRangesEq!32 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142591)) (_1!4235 lt!143299) (_2!4235 lt!143299)))))

(declare-fun b!98676 () Bool)

(declare-fun e!64524 () Bool)

(declare-fun e!64525 () Bool)

(assert (=> b!98676 (= e!64524 e!64525)))

(declare-fun res!80935 () Bool)

(declare-fun call!1234 () Bool)

(assert (=> b!98676 (= res!80935 call!1234)))

(assert (=> b!98676 (=> (not res!80935) (not e!64525))))

(declare-fun b!98677 () Bool)

(declare-fun e!64523 () Bool)

(declare-fun e!64526 () Bool)

(assert (=> b!98677 (= e!64523 e!64526)))

(declare-fun res!80934 () Bool)

(assert (=> b!98677 (=> (not res!80934) (not e!64526))))

(assert (=> b!98677 (= res!80934 e!64522)))

(declare-fun res!80933 () Bool)

(assert (=> b!98677 (=> res!80933 e!64522)))

(assert (=> b!98677 (= res!80933 (bvsge (_1!4235 lt!143299) (_2!4235 lt!143299)))))

(declare-fun lt!143298 () (_ BitVec 32))

(assert (=> b!98677 (= lt!143298 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!143297 () (_ BitVec 32))

(assert (=> b!98677 (= lt!143297 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!62)

(assert (=> b!98677 (= lt!143299 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(declare-fun b!98678 () Bool)

(assert (=> b!98678 (= e!64524 call!1234)))

(declare-fun c!6245 () Bool)

(declare-fun bm!1231 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1231 (= call!1234 (byteRangesEq!0 (select (arr!2703 (buf!2461 thiss!1288)) (_3!252 lt!143299)) (select (arr!2703 (buf!2461 (_2!4220 lt!142591))) (_3!252 lt!143299)) lt!143297 (ite c!6245 lt!143298 #b00000000000000000000000000001000)))))

(declare-fun d!30866 () Bool)

(declare-fun res!80936 () Bool)

(assert (=> d!30866 (=> res!80936 e!64523)))

(assert (=> d!30866 (= res!80936 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (=> d!30866 (= (arrayBitRangesEq!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))) e!64523)))

(declare-fun b!98679 () Bool)

(declare-fun e!64527 () Bool)

(assert (=> b!98679 (= e!64527 (byteRangesEq!0 (select (arr!2703 (buf!2461 thiss!1288)) (_4!31 lt!143299)) (select (arr!2703 (buf!2461 (_2!4220 lt!142591))) (_4!31 lt!143299)) #b00000000000000000000000000000000 lt!143298))))

(declare-fun b!98680 () Bool)

(assert (=> b!98680 (= e!64526 e!64524)))

(assert (=> b!98680 (= c!6245 (= (_3!252 lt!143299) (_4!31 lt!143299)))))

(declare-fun b!98681 () Bool)

(declare-fun res!80932 () Bool)

(assert (=> b!98681 (= res!80932 (= lt!143298 #b00000000000000000000000000000000))))

(assert (=> b!98681 (=> res!80932 e!64527)))

(assert (=> b!98681 (= e!64525 e!64527)))

(assert (= (and d!30866 (not res!80936)) b!98677))

(assert (= (and b!98677 (not res!80933)) b!98675))

(assert (= (and b!98677 res!80934) b!98680))

(assert (= (and b!98680 c!6245) b!98678))

(assert (= (and b!98680 (not c!6245)) b!98676))

(assert (= (and b!98676 res!80935) b!98681))

(assert (= (and b!98681 (not res!80932)) b!98679))

(assert (= (or b!98678 b!98676) bm!1231))

(declare-fun m!143377 () Bool)

(assert (=> b!98675 m!143377))

(assert (=> b!98677 m!142943))

(declare-fun m!143379 () Bool)

(assert (=> b!98677 m!143379))

(declare-fun m!143381 () Bool)

(assert (=> bm!1231 m!143381))

(declare-fun m!143383 () Bool)

(assert (=> bm!1231 m!143383))

(assert (=> bm!1231 m!143381))

(assert (=> bm!1231 m!143383))

(declare-fun m!143385 () Bool)

(assert (=> bm!1231 m!143385))

(declare-fun m!143387 () Bool)

(assert (=> b!98679 m!143387))

(declare-fun m!143389 () Bool)

(assert (=> b!98679 m!143389))

(assert (=> b!98679 m!143387))

(assert (=> b!98679 m!143389))

(declare-fun m!143391 () Bool)

(assert (=> b!98679 m!143391))

(assert (=> b!98557 d!30866))

(assert (=> b!98557 d!30820))

(declare-fun d!30868 () Bool)

(assert (=> d!30868 (= (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 thiss!1288)))))))

(assert (=> d!30816 d!30868))

(assert (=> b!98555 d!30820))

(assert (=> b!98555 d!30818))

(declare-fun d!30870 () Bool)

(assert (=> d!30870 (= (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 thiss!1288)))))))

(assert (=> d!30830 d!30870))

(declare-fun d!30872 () Bool)

(declare-fun res!80938 () Bool)

(declare-fun e!64528 () Bool)

(assert (=> d!30872 (=> (not res!80938) (not e!64528))))

(assert (=> d!30872 (= res!80938 (= (size!2110 (buf!2461 (_1!4222 lt!143046))) (size!2110 (buf!2461 thiss!1288))))))

(assert (=> d!30872 (= (isPrefixOf!0 (_1!4222 lt!143046) thiss!1288) e!64528)))

(declare-fun b!98682 () Bool)

(declare-fun res!80937 () Bool)

(assert (=> b!98682 (=> (not res!80937) (not e!64528))))

(assert (=> b!98682 (= res!80937 (bvsle (bitIndex!0 (size!2110 (buf!2461 (_1!4222 lt!143046))) (currentByte!4891 (_1!4222 lt!143046)) (currentBit!4886 (_1!4222 lt!143046))) (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(declare-fun b!98683 () Bool)

(declare-fun e!64529 () Bool)

(assert (=> b!98683 (= e!64528 e!64529)))

(declare-fun res!80939 () Bool)

(assert (=> b!98683 (=> res!80939 e!64529)))

(assert (=> b!98683 (= res!80939 (= (size!2110 (buf!2461 (_1!4222 lt!143046))) #b00000000000000000000000000000000))))

(declare-fun b!98684 () Bool)

(assert (=> b!98684 (= e!64529 (arrayBitRangesEq!0 (buf!2461 (_1!4222 lt!143046)) (buf!2461 thiss!1288) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 (_1!4222 lt!143046))) (currentByte!4891 (_1!4222 lt!143046)) (currentBit!4886 (_1!4222 lt!143046)))))))

(assert (= (and d!30872 res!80938) b!98682))

(assert (= (and b!98682 res!80937) b!98683))

(assert (= (and b!98683 (not res!80939)) b!98684))

(declare-fun m!143393 () Bool)

(assert (=> b!98682 m!143393))

(assert (=> b!98682 m!142943))

(assert (=> b!98684 m!143393))

(assert (=> b!98684 m!143393))

(declare-fun m!143395 () Bool)

(assert (=> b!98684 m!143395))

(assert (=> b!98591 d!30872))

(declare-fun d!30874 () Bool)

(declare-fun res!80941 () Bool)

(declare-fun e!64530 () Bool)

(assert (=> d!30874 (=> (not res!80941) (not e!64530))))

(assert (=> d!30874 (= res!80941 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142835)))))))

(assert (=> d!30874 (= (isPrefixOf!0 thiss!1288 (_2!4220 lt!142835)) e!64530)))

(declare-fun b!98685 () Bool)

(declare-fun res!80940 () Bool)

(assert (=> b!98685 (=> (not res!80940) (not e!64530))))

(assert (=> b!98685 (= res!80940 (bvsle (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142835))) (currentByte!4891 (_2!4220 lt!142835)) (currentBit!4886 (_2!4220 lt!142835)))))))

(declare-fun b!98686 () Bool)

(declare-fun e!64531 () Bool)

(assert (=> b!98686 (= e!64530 e!64531)))

(declare-fun res!80942 () Bool)

(assert (=> b!98686 (=> res!80942 e!64531)))

(assert (=> b!98686 (= res!80942 (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98687 () Bool)

(assert (=> b!98687 (= e!64531 (arrayBitRangesEq!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142835)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (= (and d!30874 res!80941) b!98685))

(assert (= (and b!98685 res!80940) b!98686))

(assert (= (and b!98686 (not res!80942)) b!98687))

(assert (=> b!98685 m!142943))

(assert (=> b!98685 m!143093))

(assert (=> b!98687 m!142943))

(assert (=> b!98687 m!142943))

(declare-fun m!143397 () Bool)

(assert (=> b!98687 m!143397))

(assert (=> b!98514 d!30874))

(declare-fun d!30876 () Bool)

(assert (=> d!30876 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142849) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) lt!142849))))

(declare-fun bs!7562 () Bool)

(assert (= bs!7562 d!30876))

(declare-fun m!143399 () Bool)

(assert (=> bs!7562 m!143399))

(assert (=> b!98515 d!30876))

(declare-fun lt!143300 () (_ BitVec 64))

(declare-fun b!98688 () Bool)

(declare-fun e!64533 () Bool)

(declare-fun lt!143302 () tuple2!7940)

(declare-fun lt!143311 () (_ BitVec 64))

(assert (=> b!98688 (= e!64533 (= (_1!4222 lt!143302) (withMovedBitIndex!0 (_2!4222 lt!143302) (bvsub lt!143311 lt!143300))))))

(assert (=> b!98688 (or (= (bvand lt!143311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143311 lt!143300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98688 (= lt!143300 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142835))) (currentByte!4891 (_2!4220 lt!142835)) (currentBit!4886 (_2!4220 lt!142835))))))

(assert (=> b!98688 (= lt!143311 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(declare-fun b!98689 () Bool)

(declare-fun res!80945 () Bool)

(assert (=> b!98689 (=> (not res!80945) (not e!64533))))

(assert (=> b!98689 (= res!80945 (isPrefixOf!0 (_2!4222 lt!143302) (_2!4220 lt!142835)))))

(declare-fun d!30878 () Bool)

(assert (=> d!30878 e!64533))

(declare-fun res!80944 () Bool)

(assert (=> d!30878 (=> (not res!80944) (not e!64533))))

(assert (=> d!30878 (= res!80944 (isPrefixOf!0 (_1!4222 lt!143302) (_2!4222 lt!143302)))))

(declare-fun lt!143306 () BitStream!3694)

(assert (=> d!30878 (= lt!143302 (tuple2!7941 lt!143306 (_2!4220 lt!142835)))))

(declare-fun lt!143301 () Unit!6029)

(declare-fun lt!143308 () Unit!6029)

(assert (=> d!30878 (= lt!143301 lt!143308)))

(assert (=> d!30878 (isPrefixOf!0 lt!143306 (_2!4220 lt!142835))))

(assert (=> d!30878 (= lt!143308 (lemmaIsPrefixTransitive!0 lt!143306 (_2!4220 lt!142835) (_2!4220 lt!142835)))))

(declare-fun lt!143310 () Unit!6029)

(declare-fun lt!143319 () Unit!6029)

(assert (=> d!30878 (= lt!143310 lt!143319)))

(assert (=> d!30878 (isPrefixOf!0 lt!143306 (_2!4220 lt!142835))))

(assert (=> d!30878 (= lt!143319 (lemmaIsPrefixTransitive!0 lt!143306 thiss!1288 (_2!4220 lt!142835)))))

(declare-fun lt!143303 () Unit!6029)

(declare-fun e!64532 () Unit!6029)

(assert (=> d!30878 (= lt!143303 e!64532)))

(declare-fun c!6246 () Bool)

(assert (=> d!30878 (= c!6246 (not (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143313 () Unit!6029)

(declare-fun lt!143304 () Unit!6029)

(assert (=> d!30878 (= lt!143313 lt!143304)))

(assert (=> d!30878 (isPrefixOf!0 (_2!4220 lt!142835) (_2!4220 lt!142835))))

(assert (=> d!30878 (= lt!143304 (lemmaIsPrefixRefl!0 (_2!4220 lt!142835)))))

(declare-fun lt!143315 () Unit!6029)

(declare-fun lt!143314 () Unit!6029)

(assert (=> d!30878 (= lt!143315 lt!143314)))

(assert (=> d!30878 (= lt!143314 (lemmaIsPrefixRefl!0 (_2!4220 lt!142835)))))

(declare-fun lt!143317 () Unit!6029)

(declare-fun lt!143309 () Unit!6029)

(assert (=> d!30878 (= lt!143317 lt!143309)))

(assert (=> d!30878 (isPrefixOf!0 lt!143306 lt!143306)))

(assert (=> d!30878 (= lt!143309 (lemmaIsPrefixRefl!0 lt!143306))))

(declare-fun lt!143318 () Unit!6029)

(declare-fun lt!143305 () Unit!6029)

(assert (=> d!30878 (= lt!143318 lt!143305)))

(assert (=> d!30878 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30878 (= lt!143305 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30878 (= lt!143306 (BitStream!3695 (buf!2461 (_2!4220 lt!142835)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (=> d!30878 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142835))))

(assert (=> d!30878 (= (reader!0 thiss!1288 (_2!4220 lt!142835)) lt!143302)))

(declare-fun b!98690 () Bool)

(declare-fun res!80943 () Bool)

(assert (=> b!98690 (=> (not res!80943) (not e!64533))))

(assert (=> b!98690 (= res!80943 (isPrefixOf!0 (_1!4222 lt!143302) thiss!1288))))

(declare-fun b!98691 () Bool)

(declare-fun Unit!6056 () Unit!6029)

(assert (=> b!98691 (= e!64532 Unit!6056)))

(declare-fun b!98692 () Bool)

(declare-fun lt!143316 () Unit!6029)

(assert (=> b!98692 (= e!64532 lt!143316)))

(declare-fun lt!143307 () (_ BitVec 64))

(assert (=> b!98692 (= lt!143307 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143312 () (_ BitVec 64))

(assert (=> b!98692 (= lt!143312 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (=> b!98692 (= lt!143316 (arrayBitRangesEqSymmetric!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142835)) lt!143307 lt!143312))))

(assert (=> b!98692 (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142835)) (buf!2461 thiss!1288) lt!143307 lt!143312)))

(assert (= (and d!30878 c!6246) b!98692))

(assert (= (and d!30878 (not c!6246)) b!98691))

(assert (= (and d!30878 res!80944) b!98690))

(assert (= (and b!98690 res!80943) b!98689))

(assert (= (and b!98689 res!80945) b!98688))

(declare-fun m!143401 () Bool)

(assert (=> d!30878 m!143401))

(assert (=> d!30878 m!143223))

(declare-fun m!143403 () Bool)

(assert (=> d!30878 m!143403))

(declare-fun m!143405 () Bool)

(assert (=> d!30878 m!143405))

(assert (=> d!30878 m!143229))

(declare-fun m!143407 () Bool)

(assert (=> d!30878 m!143407))

(declare-fun m!143409 () Bool)

(assert (=> d!30878 m!143409))

(declare-fun m!143411 () Bool)

(assert (=> d!30878 m!143411))

(declare-fun m!143413 () Bool)

(assert (=> d!30878 m!143413))

(assert (=> d!30878 m!143101))

(declare-fun m!143415 () Bool)

(assert (=> d!30878 m!143415))

(declare-fun m!143417 () Bool)

(assert (=> b!98689 m!143417))

(declare-fun m!143419 () Bool)

(assert (=> b!98688 m!143419))

(assert (=> b!98688 m!143093))

(assert (=> b!98688 m!142943))

(assert (=> b!98692 m!142943))

(declare-fun m!143421 () Bool)

(assert (=> b!98692 m!143421))

(declare-fun m!143423 () Bool)

(assert (=> b!98692 m!143423))

(declare-fun m!143425 () Bool)

(assert (=> b!98690 m!143425))

(assert (=> b!98515 d!30878))

(declare-fun d!30880 () Bool)

(assert (=> d!30880 (= (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98515 d!30880))

(declare-fun d!30882 () Bool)

(assert (=> d!30882 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142849)))

(declare-fun lt!143320 () Unit!6029)

(assert (=> d!30882 (= lt!143320 (choose!9 thiss!1288 (buf!2461 (_2!4220 lt!142835)) lt!142849 (BitStream!3695 (buf!2461 (_2!4220 lt!142835)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (=> d!30882 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2461 (_2!4220 lt!142835)) lt!142849) lt!143320)))

(declare-fun bs!7563 () Bool)

(assert (= bs!7563 d!30882))

(assert (=> bs!7563 m!143103))

(declare-fun m!143427 () Bool)

(assert (=> bs!7563 m!143427))

(assert (=> b!98515 d!30882))

(declare-fun d!30884 () Bool)

(declare-fun lt!143323 () tuple2!7960)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7960)

(assert (=> d!30884 (= lt!143323 (readNLeastSignificantBitsLoop!0 (_1!4222 lt!142846) nBits!388 #b00000000000000000000000000000000 lt!142810))))

(assert (=> d!30884 (= (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142846) nBits!388 #b00000000000000000000000000000000 lt!142810) (tuple2!7939 (_2!4232 lt!143323) (_1!4232 lt!143323)))))

(declare-fun bs!7564 () Bool)

(assert (= bs!7564 d!30884))

(declare-fun m!143429 () Bool)

(assert (=> bs!7564 m!143429))

(assert (=> b!98515 d!30884))

(assert (=> b!98593 d!30820))

(declare-fun d!30886 () Bool)

(assert (=> d!30886 (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142591)) (buf!2461 thiss!1288) lt!143051 lt!143056)))

(declare-fun lt!143326 () Unit!6029)

(declare-fun choose!8 (array!4618 array!4618 (_ BitVec 64) (_ BitVec 64)) Unit!6029)

(assert (=> d!30886 (= lt!143326 (choose!8 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142591)) lt!143051 lt!143056))))

(assert (=> d!30886 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143051) (bvsle lt!143051 lt!143056))))

(assert (=> d!30886 (= (arrayBitRangesEqSymmetric!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142591)) lt!143051 lt!143056) lt!143326)))

(declare-fun bs!7565 () Bool)

(assert (= bs!7565 d!30886))

(assert (=> bs!7565 m!143247))

(declare-fun m!143431 () Bool)

(assert (=> bs!7565 m!143431))

(assert (=> b!98593 d!30886))

(declare-fun lt!143329 () tuple4!62)

(declare-fun e!64534 () Bool)

(declare-fun b!98693 () Bool)

(assert (=> b!98693 (= e!64534 (arrayRangesEq!32 (buf!2461 (_2!4220 lt!142591)) (buf!2461 thiss!1288) (_1!4235 lt!143329) (_2!4235 lt!143329)))))

(declare-fun b!98694 () Bool)

(declare-fun e!64536 () Bool)

(declare-fun e!64537 () Bool)

(assert (=> b!98694 (= e!64536 e!64537)))

(declare-fun res!80949 () Bool)

(declare-fun call!1235 () Bool)

(assert (=> b!98694 (= res!80949 call!1235)))

(assert (=> b!98694 (=> (not res!80949) (not e!64537))))

(declare-fun b!98695 () Bool)

(declare-fun e!64535 () Bool)

(declare-fun e!64538 () Bool)

(assert (=> b!98695 (= e!64535 e!64538)))

(declare-fun res!80948 () Bool)

(assert (=> b!98695 (=> (not res!80948) (not e!64538))))

(assert (=> b!98695 (= res!80948 e!64534)))

(declare-fun res!80947 () Bool)

(assert (=> b!98695 (=> res!80947 e!64534)))

(assert (=> b!98695 (= res!80947 (bvsge (_1!4235 lt!143329) (_2!4235 lt!143329)))))

(declare-fun lt!143328 () (_ BitVec 32))

(assert (=> b!98695 (= lt!143328 ((_ extract 31 0) (bvsrem lt!143056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!143327 () (_ BitVec 32))

(assert (=> b!98695 (= lt!143327 ((_ extract 31 0) (bvsrem lt!143051 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98695 (= lt!143329 (arrayBitIndices!0 lt!143051 lt!143056))))

(declare-fun b!98696 () Bool)

(assert (=> b!98696 (= e!64536 call!1235)))

(declare-fun c!6247 () Bool)

(declare-fun bm!1232 () Bool)

(assert (=> bm!1232 (= call!1235 (byteRangesEq!0 (select (arr!2703 (buf!2461 (_2!4220 lt!142591))) (_3!252 lt!143329)) (select (arr!2703 (buf!2461 thiss!1288)) (_3!252 lt!143329)) lt!143327 (ite c!6247 lt!143328 #b00000000000000000000000000001000)))))

(declare-fun d!30888 () Bool)

(declare-fun res!80950 () Bool)

(assert (=> d!30888 (=> res!80950 e!64535)))

(assert (=> d!30888 (= res!80950 (bvsge lt!143051 lt!143056))))

(assert (=> d!30888 (= (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142591)) (buf!2461 thiss!1288) lt!143051 lt!143056) e!64535)))

(declare-fun e!64539 () Bool)

(declare-fun b!98697 () Bool)

(assert (=> b!98697 (= e!64539 (byteRangesEq!0 (select (arr!2703 (buf!2461 (_2!4220 lt!142591))) (_4!31 lt!143329)) (select (arr!2703 (buf!2461 thiss!1288)) (_4!31 lt!143329)) #b00000000000000000000000000000000 lt!143328))))

(declare-fun b!98698 () Bool)

(assert (=> b!98698 (= e!64538 e!64536)))

(assert (=> b!98698 (= c!6247 (= (_3!252 lt!143329) (_4!31 lt!143329)))))

(declare-fun b!98699 () Bool)

(declare-fun res!80946 () Bool)

(assert (=> b!98699 (= res!80946 (= lt!143328 #b00000000000000000000000000000000))))

(assert (=> b!98699 (=> res!80946 e!64539)))

(assert (=> b!98699 (= e!64537 e!64539)))

(assert (= (and d!30888 (not res!80950)) b!98695))

(assert (= (and b!98695 (not res!80947)) b!98693))

(assert (= (and b!98695 res!80948) b!98698))

(assert (= (and b!98698 c!6247) b!98696))

(assert (= (and b!98698 (not c!6247)) b!98694))

(assert (= (and b!98694 res!80949) b!98699))

(assert (= (and b!98699 (not res!80946)) b!98697))

(assert (= (or b!98696 b!98694) bm!1232))

(declare-fun m!143433 () Bool)

(assert (=> b!98693 m!143433))

(declare-fun m!143435 () Bool)

(assert (=> b!98695 m!143435))

(declare-fun m!143437 () Bool)

(assert (=> bm!1232 m!143437))

(declare-fun m!143439 () Bool)

(assert (=> bm!1232 m!143439))

(assert (=> bm!1232 m!143437))

(assert (=> bm!1232 m!143439))

(declare-fun m!143441 () Bool)

(assert (=> bm!1232 m!143441))

(declare-fun m!143443 () Bool)

(assert (=> b!98697 m!143443))

(declare-fun m!143445 () Bool)

(assert (=> b!98697 m!143445))

(assert (=> b!98697 m!143443))

(assert (=> b!98697 m!143445))

(declare-fun m!143447 () Bool)

(assert (=> b!98697 m!143447))

(assert (=> b!98593 d!30888))

(declare-fun d!30890 () Bool)

(declare-fun e!64542 () Bool)

(assert (=> d!30890 e!64542))

(declare-fun res!80953 () Bool)

(assert (=> d!30890 (=> (not res!80953) (not e!64542))))

(declare-fun lt!143334 () BitStream!3694)

(declare-fun lt!143335 () (_ BitVec 64))

(assert (=> d!30890 (= res!80953 (= (bvadd lt!143335 (bvsub lt!143055 lt!143044)) (bitIndex!0 (size!2110 (buf!2461 lt!143334)) (currentByte!4891 lt!143334) (currentBit!4886 lt!143334))))))

(assert (=> d!30890 (or (not (= (bvand lt!143335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143055 lt!143044) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143335 (bvsub lt!143055 lt!143044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30890 (= lt!143335 (bitIndex!0 (size!2110 (buf!2461 (_2!4222 lt!143046))) (currentByte!4891 (_2!4222 lt!143046)) (currentBit!4886 (_2!4222 lt!143046))))))

(declare-fun moveBitIndex!0 (BitStream!3694 (_ BitVec 64)) tuple2!7936)

(assert (=> d!30890 (= lt!143334 (_2!4220 (moveBitIndex!0 (_2!4222 lt!143046) (bvsub lt!143055 lt!143044))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3694 (_ BitVec 64)) Bool)

(assert (=> d!30890 (moveBitIndexPrecond!0 (_2!4222 lt!143046) (bvsub lt!143055 lt!143044))))

(assert (=> d!30890 (= (withMovedBitIndex!0 (_2!4222 lt!143046) (bvsub lt!143055 lt!143044)) lt!143334)))

(declare-fun b!98702 () Bool)

(assert (=> b!98702 (= e!64542 (= (size!2110 (buf!2461 (_2!4222 lt!143046))) (size!2110 (buf!2461 lt!143334))))))

(assert (= (and d!30890 res!80953) b!98702))

(declare-fun m!143449 () Bool)

(assert (=> d!30890 m!143449))

(declare-fun m!143451 () Bool)

(assert (=> d!30890 m!143451))

(declare-fun m!143453 () Bool)

(assert (=> d!30890 m!143453))

(declare-fun m!143455 () Bool)

(assert (=> d!30890 m!143455))

(assert (=> b!98589 d!30890))

(assert (=> b!98589 d!30818))

(assert (=> b!98589 d!30820))

(declare-fun d!30892 () Bool)

(declare-datatypes ((tuple2!7966 0))(
  ( (tuple2!7967 (_1!4236 Bool) (_2!4236 BitStream!3694)) )
))
(declare-fun lt!143338 () tuple2!7966)

(declare-fun readBit!0 (BitStream!3694) tuple2!7966)

(assert (=> d!30892 (= lt!143338 (readBit!0 (readerFrom!0 (_2!4220 lt!142827) (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288))))))

(assert (=> d!30892 (= (readBitPure!0 (readerFrom!0 (_2!4220 lt!142827) (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288))) (tuple2!7955 (_2!4236 lt!143338) (_1!4236 lt!143338)))))

(declare-fun bs!7566 () Bool)

(assert (= bs!7566 d!30892))

(assert (=> bs!7566 m!143033))

(declare-fun m!143457 () Bool)

(assert (=> bs!7566 m!143457))

(assert (=> b!98512 d!30892))

(declare-fun d!30894 () Bool)

(declare-fun e!64545 () Bool)

(assert (=> d!30894 e!64545))

(declare-fun res!80957 () Bool)

(assert (=> d!30894 (=> (not res!80957) (not e!64545))))

(assert (=> d!30894 (= res!80957 (invariant!0 (currentBit!4886 (_2!4220 lt!142827)) (currentByte!4891 (_2!4220 lt!142827)) (size!2110 (buf!2461 (_2!4220 lt!142827)))))))

(assert (=> d!30894 (= (readerFrom!0 (_2!4220 lt!142827) (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288)) (BitStream!3695 (buf!2461 (_2!4220 lt!142827)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(declare-fun b!98705 () Bool)

(assert (=> b!98705 (= e!64545 (invariant!0 (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288) (size!2110 (buf!2461 (_2!4220 lt!142827)))))))

(assert (= (and d!30894 res!80957) b!98705))

(declare-fun m!143459 () Bool)

(assert (=> d!30894 m!143459))

(declare-fun m!143461 () Bool)

(assert (=> b!98705 m!143461))

(assert (=> b!98512 d!30894))

(declare-fun d!30896 () Bool)

(declare-fun res!80959 () Bool)

(declare-fun e!64546 () Bool)

(assert (=> d!30896 (=> (not res!80959) (not e!64546))))

(assert (=> d!30896 (= res!80959 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!142827)))))))

(assert (=> d!30896 (= (isPrefixOf!0 thiss!1288 (_2!4220 lt!142827)) e!64546)))

(declare-fun b!98706 () Bool)

(declare-fun res!80958 () Bool)

(assert (=> b!98706 (=> (not res!80958) (not e!64546))))

(assert (=> b!98706 (= res!80958 (bvsle (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142827))) (currentByte!4891 (_2!4220 lt!142827)) (currentBit!4886 (_2!4220 lt!142827)))))))

(declare-fun b!98707 () Bool)

(declare-fun e!64547 () Bool)

(assert (=> b!98707 (= e!64546 e!64547)))

(declare-fun res!80960 () Bool)

(assert (=> b!98707 (=> res!80960 e!64547)))

(assert (=> b!98707 (= res!80960 (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98708 () Bool)

(assert (=> b!98708 (= e!64547 (arrayBitRangesEq!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142827)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (= (and d!30896 res!80959) b!98706))

(assert (= (and b!98706 res!80958) b!98707))

(assert (= (and b!98707 (not res!80960)) b!98708))

(assert (=> b!98706 m!142943))

(assert (=> b!98706 m!143099))

(assert (=> b!98708 m!142943))

(assert (=> b!98708 m!142943))

(declare-fun m!143463 () Bool)

(assert (=> b!98708 m!143463))

(assert (=> b!98513 d!30896))

(declare-fun d!30898 () Bool)

(declare-fun res!80962 () Bool)

(declare-fun e!64548 () Bool)

(assert (=> d!30898 (=> (not res!80962) (not e!64548))))

(assert (=> d!30898 (= res!80962 (= (size!2110 (buf!2461 (_2!4222 lt!143046))) (size!2110 (buf!2461 (_2!4220 lt!142591)))))))

(assert (=> d!30898 (= (isPrefixOf!0 (_2!4222 lt!143046) (_2!4220 lt!142591)) e!64548)))

(declare-fun b!98709 () Bool)

(declare-fun res!80961 () Bool)

(assert (=> b!98709 (=> (not res!80961) (not e!64548))))

(assert (=> b!98709 (= res!80961 (bvsle (bitIndex!0 (size!2110 (buf!2461 (_2!4222 lt!143046))) (currentByte!4891 (_2!4222 lt!143046)) (currentBit!4886 (_2!4222 lt!143046))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591)))))))

(declare-fun b!98710 () Bool)

(declare-fun e!64549 () Bool)

(assert (=> b!98710 (= e!64548 e!64549)))

(declare-fun res!80963 () Bool)

(assert (=> b!98710 (=> res!80963 e!64549)))

(assert (=> b!98710 (= res!80963 (= (size!2110 (buf!2461 (_2!4222 lt!143046))) #b00000000000000000000000000000000))))

(declare-fun b!98711 () Bool)

(assert (=> b!98711 (= e!64549 (arrayBitRangesEq!0 (buf!2461 (_2!4222 lt!143046)) (buf!2461 (_2!4220 lt!142591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 (_2!4222 lt!143046))) (currentByte!4891 (_2!4222 lt!143046)) (currentBit!4886 (_2!4222 lt!143046)))))))

(assert (= (and d!30898 res!80962) b!98709))

(assert (= (and b!98709 res!80961) b!98710))

(assert (= (and b!98710 (not res!80963)) b!98711))

(assert (=> b!98709 m!143451))

(assert (=> b!98709 m!142941))

(assert (=> b!98711 m!143451))

(assert (=> b!98711 m!143451))

(declare-fun m!143465 () Bool)

(assert (=> b!98711 m!143465))

(assert (=> b!98590 d!30898))

(declare-fun d!30900 () Bool)

(assert (=> d!30900 (isPrefixOf!0 lt!143050 (_2!4220 lt!142591))))

(declare-fun lt!143341 () Unit!6029)

(declare-fun choose!30 (BitStream!3694 BitStream!3694 BitStream!3694) Unit!6029)

(assert (=> d!30900 (= lt!143341 (choose!30 lt!143050 thiss!1288 (_2!4220 lt!142591)))))

(assert (=> d!30900 (isPrefixOf!0 lt!143050 thiss!1288)))

(assert (=> d!30900 (= (lemmaIsPrefixTransitive!0 lt!143050 thiss!1288 (_2!4220 lt!142591)) lt!143341)))

(declare-fun bs!7567 () Bool)

(assert (= bs!7567 d!30900))

(assert (=> bs!7567 m!143237))

(declare-fun m!143467 () Bool)

(assert (=> bs!7567 m!143467))

(declare-fun m!143469 () Bool)

(assert (=> bs!7567 m!143469))

(assert (=> d!30834 d!30900))

(declare-fun d!30902 () Bool)

(assert (=> d!30902 (isPrefixOf!0 (_2!4220 lt!142591) (_2!4220 lt!142591))))

(declare-fun lt!143344 () Unit!6029)

(declare-fun choose!11 (BitStream!3694) Unit!6029)

(assert (=> d!30902 (= lt!143344 (choose!11 (_2!4220 lt!142591)))))

(assert (=> d!30902 (= (lemmaIsPrefixRefl!0 (_2!4220 lt!142591)) lt!143344)))

(declare-fun bs!7569 () Bool)

(assert (= bs!7569 d!30902))

(assert (=> bs!7569 m!143221))

(declare-fun m!143471 () Bool)

(assert (=> bs!7569 m!143471))

(assert (=> d!30834 d!30902))

(declare-fun d!30904 () Bool)

(assert (=> d!30904 (isPrefixOf!0 thiss!1288 thiss!1288)))

(declare-fun lt!143345 () Unit!6029)

(assert (=> d!30904 (= lt!143345 (choose!11 thiss!1288))))

(assert (=> d!30904 (= (lemmaIsPrefixRefl!0 thiss!1288) lt!143345)))

(declare-fun bs!7570 () Bool)

(assert (= bs!7570 d!30904))

(assert (=> bs!7570 m!143229))

(declare-fun m!143473 () Bool)

(assert (=> bs!7570 m!143473))

(assert (=> d!30834 d!30904))

(declare-fun d!30906 () Bool)

(assert (=> d!30906 (isPrefixOf!0 lt!143050 lt!143050)))

(declare-fun lt!143346 () Unit!6029)

(assert (=> d!30906 (= lt!143346 (choose!11 lt!143050))))

(assert (=> d!30906 (= (lemmaIsPrefixRefl!0 lt!143050) lt!143346)))

(declare-fun bs!7571 () Bool)

(assert (= bs!7571 d!30906))

(assert (=> bs!7571 m!143231))

(declare-fun m!143475 () Bool)

(assert (=> bs!7571 m!143475))

(assert (=> d!30834 d!30906))

(declare-fun d!30908 () Bool)

(declare-fun res!80965 () Bool)

(declare-fun e!64550 () Bool)

(assert (=> d!30908 (=> (not res!80965) (not e!64550))))

(assert (=> d!30908 (= res!80965 (= (size!2110 (buf!2461 lt!143050)) (size!2110 (buf!2461 (_2!4220 lt!142591)))))))

(assert (=> d!30908 (= (isPrefixOf!0 lt!143050 (_2!4220 lt!142591)) e!64550)))

(declare-fun b!98712 () Bool)

(declare-fun res!80964 () Bool)

(assert (=> b!98712 (=> (not res!80964) (not e!64550))))

(assert (=> b!98712 (= res!80964 (bvsle (bitIndex!0 (size!2110 (buf!2461 lt!143050)) (currentByte!4891 lt!143050) (currentBit!4886 lt!143050)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591)))))))

(declare-fun b!98713 () Bool)

(declare-fun e!64551 () Bool)

(assert (=> b!98713 (= e!64550 e!64551)))

(declare-fun res!80966 () Bool)

(assert (=> b!98713 (=> res!80966 e!64551)))

(assert (=> b!98713 (= res!80966 (= (size!2110 (buf!2461 lt!143050)) #b00000000000000000000000000000000))))

(declare-fun b!98714 () Bool)

(assert (=> b!98714 (= e!64551 (arrayBitRangesEq!0 (buf!2461 lt!143050) (buf!2461 (_2!4220 lt!142591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 lt!143050)) (currentByte!4891 lt!143050) (currentBit!4886 lt!143050))))))

(assert (= (and d!30908 res!80965) b!98712))

(assert (= (and b!98712 res!80964) b!98713))

(assert (= (and b!98713 (not res!80966)) b!98714))

(declare-fun m!143477 () Bool)

(assert (=> b!98712 m!143477))

(assert (=> b!98712 m!142941))

(assert (=> b!98714 m!143477))

(assert (=> b!98714 m!143477))

(declare-fun m!143479 () Bool)

(assert (=> b!98714 m!143479))

(assert (=> d!30834 d!30908))

(declare-fun d!30910 () Bool)

(assert (=> d!30910 (isPrefixOf!0 lt!143050 (_2!4220 lt!142591))))

(declare-fun lt!143347 () Unit!6029)

(assert (=> d!30910 (= lt!143347 (choose!30 lt!143050 (_2!4220 lt!142591) (_2!4220 lt!142591)))))

(assert (=> d!30910 (isPrefixOf!0 lt!143050 (_2!4220 lt!142591))))

(assert (=> d!30910 (= (lemmaIsPrefixTransitive!0 lt!143050 (_2!4220 lt!142591) (_2!4220 lt!142591)) lt!143347)))

(declare-fun bs!7572 () Bool)

(assert (= bs!7572 d!30910))

(assert (=> bs!7572 m!143237))

(declare-fun m!143481 () Bool)

(assert (=> bs!7572 m!143481))

(assert (=> bs!7572 m!143237))

(assert (=> d!30834 d!30910))

(assert (=> d!30834 d!30822))

(declare-fun d!30912 () Bool)

(declare-fun res!80968 () Bool)

(declare-fun e!64552 () Bool)

(assert (=> d!30912 (=> (not res!80968) (not e!64552))))

(assert (=> d!30912 (= res!80968 (= (size!2110 (buf!2461 (_2!4220 lt!142591))) (size!2110 (buf!2461 (_2!4220 lt!142591)))))))

(assert (=> d!30912 (= (isPrefixOf!0 (_2!4220 lt!142591) (_2!4220 lt!142591)) e!64552)))

(declare-fun b!98715 () Bool)

(declare-fun res!80967 () Bool)

(assert (=> b!98715 (=> (not res!80967) (not e!64552))))

(assert (=> b!98715 (= res!80967 (bvsle (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591)))))))

(declare-fun b!98716 () Bool)

(declare-fun e!64553 () Bool)

(assert (=> b!98716 (= e!64552 e!64553)))

(declare-fun res!80969 () Bool)

(assert (=> b!98716 (=> res!80969 e!64553)))

(assert (=> b!98716 (= res!80969 (= (size!2110 (buf!2461 (_2!4220 lt!142591))) #b00000000000000000000000000000000))))

(declare-fun b!98717 () Bool)

(assert (=> b!98717 (= e!64553 (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142591)) (buf!2461 (_2!4220 lt!142591)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142591))) (currentByte!4891 (_2!4220 lt!142591)) (currentBit!4886 (_2!4220 lt!142591)))))))

(assert (= (and d!30912 res!80968) b!98715))

(assert (= (and b!98715 res!80967) b!98716))

(assert (= (and b!98716 (not res!80969)) b!98717))

(assert (=> b!98715 m!142941))

(assert (=> b!98715 m!142941))

(assert (=> b!98717 m!142941))

(assert (=> b!98717 m!142941))

(declare-fun m!143483 () Bool)

(assert (=> b!98717 m!143483))

(assert (=> d!30834 d!30912))

(declare-fun d!30914 () Bool)

(declare-fun res!80971 () Bool)

(declare-fun e!64554 () Bool)

(assert (=> d!30914 (=> (not res!80971) (not e!64554))))

(assert (=> d!30914 (= res!80971 (= (size!2110 (buf!2461 (_1!4222 lt!143046))) (size!2110 (buf!2461 (_2!4222 lt!143046)))))))

(assert (=> d!30914 (= (isPrefixOf!0 (_1!4222 lt!143046) (_2!4222 lt!143046)) e!64554)))

(declare-fun b!98718 () Bool)

(declare-fun res!80970 () Bool)

(assert (=> b!98718 (=> (not res!80970) (not e!64554))))

(assert (=> b!98718 (= res!80970 (bvsle (bitIndex!0 (size!2110 (buf!2461 (_1!4222 lt!143046))) (currentByte!4891 (_1!4222 lt!143046)) (currentBit!4886 (_1!4222 lt!143046))) (bitIndex!0 (size!2110 (buf!2461 (_2!4222 lt!143046))) (currentByte!4891 (_2!4222 lt!143046)) (currentBit!4886 (_2!4222 lt!143046)))))))

(declare-fun b!98719 () Bool)

(declare-fun e!64555 () Bool)

(assert (=> b!98719 (= e!64554 e!64555)))

(declare-fun res!80972 () Bool)

(assert (=> b!98719 (=> res!80972 e!64555)))

(assert (=> b!98719 (= res!80972 (= (size!2110 (buf!2461 (_1!4222 lt!143046))) #b00000000000000000000000000000000))))

(declare-fun b!98720 () Bool)

(assert (=> b!98720 (= e!64555 (arrayBitRangesEq!0 (buf!2461 (_1!4222 lt!143046)) (buf!2461 (_2!4222 lt!143046)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 (_1!4222 lt!143046))) (currentByte!4891 (_1!4222 lt!143046)) (currentBit!4886 (_1!4222 lt!143046)))))))

(assert (= (and d!30914 res!80971) b!98718))

(assert (= (and b!98718 res!80970) b!98719))

(assert (= (and b!98719 (not res!80972)) b!98720))

(assert (=> b!98718 m!143393))

(assert (=> b!98718 m!143451))

(assert (=> b!98720 m!143393))

(assert (=> b!98720 m!143393))

(declare-fun m!143485 () Bool)

(assert (=> b!98720 m!143485))

(assert (=> d!30834 d!30914))

(declare-fun d!30916 () Bool)

(declare-fun res!80974 () Bool)

(declare-fun e!64556 () Bool)

(assert (=> d!30916 (=> (not res!80974) (not e!64556))))

(assert (=> d!30916 (= res!80974 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 thiss!1288))))))

(assert (=> d!30916 (= (isPrefixOf!0 thiss!1288 thiss!1288) e!64556)))

(declare-fun b!98721 () Bool)

(declare-fun res!80973 () Bool)

(assert (=> b!98721 (=> (not res!80973) (not e!64556))))

(assert (=> b!98721 (= res!80973 (bvsle (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(declare-fun b!98722 () Bool)

(declare-fun e!64557 () Bool)

(assert (=> b!98722 (= e!64556 e!64557)))

(declare-fun res!80975 () Bool)

(assert (=> b!98722 (=> res!80975 e!64557)))

(assert (=> b!98722 (= res!80975 (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98723 () Bool)

(assert (=> b!98723 (= e!64557 (arrayBitRangesEq!0 (buf!2461 thiss!1288) (buf!2461 thiss!1288) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (= (and d!30916 res!80974) b!98721))

(assert (= (and b!98721 res!80973) b!98722))

(assert (= (and b!98722 (not res!80975)) b!98723))

(assert (=> b!98721 m!142943))

(assert (=> b!98721 m!142943))

(assert (=> b!98723 m!142943))

(assert (=> b!98723 m!142943))

(declare-fun m!143487 () Bool)

(assert (=> b!98723 m!143487))

(assert (=> d!30834 d!30916))

(declare-fun d!30918 () Bool)

(declare-fun res!80977 () Bool)

(declare-fun e!64558 () Bool)

(assert (=> d!30918 (=> (not res!80977) (not e!64558))))

(assert (=> d!30918 (= res!80977 (= (size!2110 (buf!2461 lt!143050)) (size!2110 (buf!2461 lt!143050))))))

(assert (=> d!30918 (= (isPrefixOf!0 lt!143050 lt!143050) e!64558)))

(declare-fun b!98724 () Bool)

(declare-fun res!80976 () Bool)

(assert (=> b!98724 (=> (not res!80976) (not e!64558))))

(assert (=> b!98724 (= res!80976 (bvsle (bitIndex!0 (size!2110 (buf!2461 lt!143050)) (currentByte!4891 lt!143050) (currentBit!4886 lt!143050)) (bitIndex!0 (size!2110 (buf!2461 lt!143050)) (currentByte!4891 lt!143050) (currentBit!4886 lt!143050))))))

(declare-fun b!98725 () Bool)

(declare-fun e!64559 () Bool)

(assert (=> b!98725 (= e!64558 e!64559)))

(declare-fun res!80978 () Bool)

(assert (=> b!98725 (=> res!80978 e!64559)))

(assert (=> b!98725 (= res!80978 (= (size!2110 (buf!2461 lt!143050)) #b00000000000000000000000000000000))))

(declare-fun b!98726 () Bool)

(assert (=> b!98726 (= e!64559 (arrayBitRangesEq!0 (buf!2461 lt!143050) (buf!2461 lt!143050) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 lt!143050)) (currentByte!4891 lt!143050) (currentBit!4886 lt!143050))))))

(assert (= (and d!30918 res!80977) b!98724))

(assert (= (and b!98724 res!80976) b!98725))

(assert (= (and b!98725 (not res!80978)) b!98726))

(assert (=> b!98724 m!143477))

(assert (=> b!98724 m!143477))

(assert (=> b!98726 m!143477))

(assert (=> b!98726 m!143477))

(declare-fun m!143489 () Bool)

(assert (=> b!98726 m!143489))

(assert (=> d!30834 d!30918))

(declare-fun d!30920 () Bool)

(declare-fun e!64560 () Bool)

(assert (=> d!30920 e!64560))

(declare-fun res!80980 () Bool)

(assert (=> d!30920 (=> (not res!80980) (not e!64560))))

(declare-fun lt!143353 () (_ BitVec 64))

(declare-fun lt!143348 () (_ BitVec 64))

(declare-fun lt!143349 () (_ BitVec 64))

(assert (=> d!30920 (= res!80980 (= lt!143353 (bvsub lt!143348 lt!143349)))))

(assert (=> d!30920 (or (= (bvand lt!143348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143349 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143348 lt!143349) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30920 (= lt!143349 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142848)))) ((_ sign_extend 32) (currentByte!4891 (_1!4229 lt!142848))) ((_ sign_extend 32) (currentBit!4886 (_1!4229 lt!142848)))))))

(declare-fun lt!143351 () (_ BitVec 64))

(declare-fun lt!143352 () (_ BitVec 64))

(assert (=> d!30920 (= lt!143348 (bvmul lt!143351 lt!143352))))

(assert (=> d!30920 (or (= lt!143351 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143352 (bvsdiv (bvmul lt!143351 lt!143352) lt!143351)))))

(assert (=> d!30920 (= lt!143352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30920 (= lt!143351 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142848)))))))

(assert (=> d!30920 (= lt!143353 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_1!4229 lt!142848))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_1!4229 lt!142848)))))))

(assert (=> d!30920 (invariant!0 (currentBit!4886 (_1!4229 lt!142848)) (currentByte!4891 (_1!4229 lt!142848)) (size!2110 (buf!2461 (_1!4229 lt!142848))))))

(assert (=> d!30920 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!142848))) (currentByte!4891 (_1!4229 lt!142848)) (currentBit!4886 (_1!4229 lt!142848))) lt!143353)))

(declare-fun b!98727 () Bool)

(declare-fun res!80979 () Bool)

(assert (=> b!98727 (=> (not res!80979) (not e!64560))))

(assert (=> b!98727 (= res!80979 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143353))))

(declare-fun b!98728 () Bool)

(declare-fun lt!143350 () (_ BitVec 64))

(assert (=> b!98728 (= e!64560 (bvsle lt!143353 (bvmul lt!143350 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98728 (or (= lt!143350 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143350 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143350)))))

(assert (=> b!98728 (= lt!143350 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142848)))))))

(assert (= (and d!30920 res!80980) b!98727))

(assert (= (and b!98727 res!80979) b!98728))

(declare-fun m!143491 () Bool)

(assert (=> d!30920 m!143491))

(declare-fun m!143493 () Bool)

(assert (=> d!30920 m!143493))

(assert (=> b!98510 d!30920))

(declare-fun d!30922 () Bool)

(declare-fun e!64561 () Bool)

(assert (=> d!30922 e!64561))

(declare-fun res!80982 () Bool)

(assert (=> d!30922 (=> (not res!80982) (not e!64561))))

(declare-fun lt!143354 () (_ BitVec 64))

(declare-fun lt!143355 () (_ BitVec 64))

(declare-fun lt!143359 () (_ BitVec 64))

(assert (=> d!30922 (= res!80982 (= lt!143359 (bvsub lt!143354 lt!143355)))))

(assert (=> d!30922 (or (= (bvand lt!143354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143354 lt!143355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30922 (= lt!143355 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142827)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142827))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142827)))))))

(declare-fun lt!143357 () (_ BitVec 64))

(declare-fun lt!143358 () (_ BitVec 64))

(assert (=> d!30922 (= lt!143354 (bvmul lt!143357 lt!143358))))

(assert (=> d!30922 (or (= lt!143357 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143358 (bvsdiv (bvmul lt!143357 lt!143358) lt!143357)))))

(assert (=> d!30922 (= lt!143358 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30922 (= lt!143357 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142827)))))))

(assert (=> d!30922 (= lt!143359 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142827))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142827)))))))

(assert (=> d!30922 (invariant!0 (currentBit!4886 (_2!4220 lt!142827)) (currentByte!4891 (_2!4220 lt!142827)) (size!2110 (buf!2461 (_2!4220 lt!142827))))))

(assert (=> d!30922 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142827))) (currentByte!4891 (_2!4220 lt!142827)) (currentBit!4886 (_2!4220 lt!142827))) lt!143359)))

(declare-fun b!98729 () Bool)

(declare-fun res!80981 () Bool)

(assert (=> b!98729 (=> (not res!80981) (not e!64561))))

(assert (=> b!98729 (= res!80981 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143359))))

(declare-fun b!98730 () Bool)

(declare-fun lt!143356 () (_ BitVec 64))

(assert (=> b!98730 (= e!64561 (bvsle lt!143359 (bvmul lt!143356 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98730 (or (= lt!143356 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143356 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143356)))))

(assert (=> b!98730 (= lt!143356 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142827)))))))

(assert (= (and d!30922 res!80982) b!98729))

(assert (= (and b!98729 res!80981) b!98730))

(declare-fun m!143495 () Bool)

(assert (=> d!30922 m!143495))

(assert (=> d!30922 m!143459))

(assert (=> b!98510 d!30922))

(declare-fun d!30924 () Bool)

(declare-fun res!80984 () Bool)

(declare-fun e!64562 () Bool)

(assert (=> d!30924 (=> (not res!80984) (not e!64562))))

(assert (=> d!30924 (= res!80984 (= (size!2110 (buf!2461 (ite c!6226 thiss!1288 lt!142831))) (size!2110 (buf!2461 (ite c!6226 (_2!4220 lt!142819) lt!142831)))))))

(assert (=> d!30924 (= (isPrefixOf!0 (ite c!6226 thiss!1288 lt!142831) (ite c!6226 (_2!4220 lt!142819) lt!142831)) e!64562)))

(declare-fun b!98731 () Bool)

(declare-fun res!80983 () Bool)

(assert (=> b!98731 (=> (not res!80983) (not e!64562))))

(assert (=> b!98731 (= res!80983 (bvsle (bitIndex!0 (size!2110 (buf!2461 (ite c!6226 thiss!1288 lt!142831))) (currentByte!4891 (ite c!6226 thiss!1288 lt!142831)) (currentBit!4886 (ite c!6226 thiss!1288 lt!142831))) (bitIndex!0 (size!2110 (buf!2461 (ite c!6226 (_2!4220 lt!142819) lt!142831))) (currentByte!4891 (ite c!6226 (_2!4220 lt!142819) lt!142831)) (currentBit!4886 (ite c!6226 (_2!4220 lt!142819) lt!142831)))))))

(declare-fun b!98732 () Bool)

(declare-fun e!64563 () Bool)

(assert (=> b!98732 (= e!64562 e!64563)))

(declare-fun res!80985 () Bool)

(assert (=> b!98732 (=> res!80985 e!64563)))

(assert (=> b!98732 (= res!80985 (= (size!2110 (buf!2461 (ite c!6226 thiss!1288 lt!142831))) #b00000000000000000000000000000000))))

(declare-fun b!98733 () Bool)

(assert (=> b!98733 (= e!64563 (arrayBitRangesEq!0 (buf!2461 (ite c!6226 thiss!1288 lt!142831)) (buf!2461 (ite c!6226 (_2!4220 lt!142819) lt!142831)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2110 (buf!2461 (ite c!6226 thiss!1288 lt!142831))) (currentByte!4891 (ite c!6226 thiss!1288 lt!142831)) (currentBit!4886 (ite c!6226 thiss!1288 lt!142831)))))))

(assert (= (and d!30924 res!80984) b!98731))

(assert (= (and b!98731 res!80983) b!98732))

(assert (= (and b!98732 (not res!80985)) b!98733))

(declare-fun m!143497 () Bool)

(assert (=> b!98731 m!143497))

(declare-fun m!143499 () Bool)

(assert (=> b!98731 m!143499))

(assert (=> b!98733 m!143497))

(assert (=> b!98733 m!143497))

(declare-fun m!143501 () Bool)

(assert (=> b!98733 m!143501))

(assert (=> bm!1222 d!30924))

(declare-fun d!30926 () Bool)

(assert (=> d!30926 (= (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142591))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142591)))) (bvsub (bvmul ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142591))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142591))))))))

(assert (=> d!30818 d!30926))

(declare-fun d!30928 () Bool)

(assert (=> d!30928 (= (invariant!0 (currentBit!4886 (_2!4220 lt!142591)) (currentByte!4891 (_2!4220 lt!142591)) (size!2110 (buf!2461 (_2!4220 lt!142591)))) (and (bvsge (currentBit!4886 (_2!4220 lt!142591)) #b00000000000000000000000000000000) (bvslt (currentBit!4886 (_2!4220 lt!142591)) #b00000000000000000000000000001000) (bvsge (currentByte!4891 (_2!4220 lt!142591)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4891 (_2!4220 lt!142591)) (size!2110 (buf!2461 (_2!4220 lt!142591)))) (and (= (currentBit!4886 (_2!4220 lt!142591)) #b00000000000000000000000000000000) (= (currentByte!4891 (_2!4220 lt!142591)) (size!2110 (buf!2461 (_2!4220 lt!142591))))))))))

(assert (=> d!30818 d!30928))

(declare-fun d!30930 () Bool)

(assert (=> d!30930 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834))) lt!142814)))

(declare-fun lt!143360 () Unit!6029)

(assert (=> d!30930 (= lt!143360 (choose!9 (_2!4220 lt!142834) (buf!2461 (_2!4220 lt!142819)) lt!142814 (BitStream!3695 (buf!2461 (_2!4220 lt!142819)) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834)))))))

(assert (=> d!30930 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4220 lt!142834) (buf!2461 (_2!4220 lt!142819)) lt!142814) lt!143360)))

(declare-fun bs!7573 () Bool)

(assert (= bs!7573 d!30930))

(assert (=> bs!7573 m!143051))

(declare-fun m!143503 () Bool)

(assert (=> bs!7573 m!143503))

(assert (=> b!98507 d!30930))

(declare-fun d!30932 () Bool)

(declare-fun lt!143361 () tuple2!7966)

(assert (=> d!30932 (= lt!143361 (readBit!0 (_1!4222 lt!142824)))))

(assert (=> d!30932 (= (readBitPure!0 (_1!4222 lt!142824)) (tuple2!7955 (_2!4236 lt!143361) (_1!4236 lt!143361)))))

(declare-fun bs!7574 () Bool)

(assert (= bs!7574 d!30932))

(declare-fun m!143505 () Bool)

(assert (=> bs!7574 m!143505))

(assert (=> b!98507 d!30932))

(declare-fun b!98744 () Bool)

(declare-fun res!80996 () Bool)

(declare-fun e!64568 () Bool)

(assert (=> b!98744 (=> (not res!80996) (not e!64568))))

(declare-fun lt!143373 () tuple2!7936)

(assert (=> b!98744 (= res!80996 (isPrefixOf!0 thiss!1288 (_2!4220 lt!143373)))))

(declare-fun d!30934 () Bool)

(assert (=> d!30934 e!64568))

(declare-fun res!80995 () Bool)

(assert (=> d!30934 (=> (not res!80995) (not e!64568))))

(assert (=> d!30934 (= res!80995 (= (size!2110 (buf!2461 thiss!1288)) (size!2110 (buf!2461 (_2!4220 lt!143373)))))))

(declare-fun choose!16 (BitStream!3694 Bool) tuple2!7936)

(assert (=> d!30934 (= lt!143373 (choose!16 thiss!1288 lt!142832))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!30934 (validate_offset_bit!0 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)))))

(assert (=> d!30934 (= (appendBit!0 thiss!1288 lt!142832) lt!143373)))

(declare-fun b!98746 () Bool)

(declare-fun e!64569 () Bool)

(declare-fun lt!143371 () tuple2!7954)

(assert (=> b!98746 (= e!64569 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!143371))) (currentByte!4891 (_1!4229 lt!143371)) (currentBit!4886 (_1!4229 lt!143371))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143373))) (currentByte!4891 (_2!4220 lt!143373)) (currentBit!4886 (_2!4220 lt!143373)))))))

(declare-fun b!98745 () Bool)

(assert (=> b!98745 (= e!64568 e!64569)))

(declare-fun res!80997 () Bool)

(assert (=> b!98745 (=> (not res!80997) (not e!64569))))

(assert (=> b!98745 (= res!80997 (and (= (_2!4229 lt!143371) lt!142832) (= (_1!4229 lt!143371) (_2!4220 lt!143373))))))

(assert (=> b!98745 (= lt!143371 (readBitPure!0 (readerFrom!0 (_2!4220 lt!143373) (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288))))))

(declare-fun b!98743 () Bool)

(declare-fun res!80994 () Bool)

(assert (=> b!98743 (=> (not res!80994) (not e!64568))))

(declare-fun lt!143370 () (_ BitVec 64))

(declare-fun lt!143372 () (_ BitVec 64))

(assert (=> b!98743 (= res!80994 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143373))) (currentByte!4891 (_2!4220 lt!143373)) (currentBit!4886 (_2!4220 lt!143373))) (bvadd lt!143370 lt!143372)))))

(assert (=> b!98743 (or (not (= (bvand lt!143370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143372 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143370 lt!143372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98743 (= lt!143372 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!98743 (= lt!143370 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (= (and d!30934 res!80995) b!98743))

(assert (= (and b!98743 res!80994) b!98744))

(assert (= (and b!98744 res!80996) b!98745))

(assert (= (and b!98745 res!80997) b!98746))

(declare-fun m!143507 () Bool)

(assert (=> b!98743 m!143507))

(assert (=> b!98743 m!142943))

(declare-fun m!143509 () Bool)

(assert (=> b!98744 m!143509))

(declare-fun m!143511 () Bool)

(assert (=> b!98746 m!143511))

(assert (=> b!98746 m!143507))

(declare-fun m!143513 () Bool)

(assert (=> d!30934 m!143513))

(declare-fun m!143515 () Bool)

(assert (=> d!30934 m!143515))

(declare-fun m!143517 () Bool)

(assert (=> b!98745 m!143517))

(assert (=> b!98745 m!143517))

(declare-fun m!143519 () Bool)

(assert (=> b!98745 m!143519))

(assert (=> b!98507 d!30934))

(declare-fun d!30936 () Bool)

(declare-fun e!64570 () Bool)

(assert (=> d!30936 e!64570))

(declare-fun res!80998 () Bool)

(assert (=> d!30936 (=> (not res!80998) (not e!64570))))

(declare-fun lt!143375 () (_ BitVec 64))

(declare-fun lt!143374 () BitStream!3694)

(assert (=> d!30936 (= res!80998 (= (bvadd lt!143375 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2110 (buf!2461 lt!143374)) (currentByte!4891 lt!143374) (currentBit!4886 lt!143374))))))

(assert (=> d!30936 (or (not (= (bvand lt!143375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143375 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30936 (= lt!143375 (bitIndex!0 (size!2110 (buf!2461 (_1!4222 lt!142824))) (currentByte!4891 (_1!4222 lt!142824)) (currentBit!4886 (_1!4222 lt!142824))))))

(assert (=> d!30936 (= lt!143374 (_2!4220 (moveBitIndex!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!30936 (moveBitIndexPrecond!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!30936 (= (withMovedBitIndex!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001) lt!143374)))

(declare-fun b!98747 () Bool)

(assert (=> b!98747 (= e!64570 (= (size!2110 (buf!2461 (_1!4222 lt!142824))) (size!2110 (buf!2461 lt!143374))))))

(assert (= (and d!30936 res!80998) b!98747))

(declare-fun m!143521 () Bool)

(assert (=> d!30936 m!143521))

(declare-fun m!143523 () Bool)

(assert (=> d!30936 m!143523))

(declare-fun m!143525 () Bool)

(assert (=> d!30936 m!143525))

(declare-fun m!143527 () Bool)

(assert (=> d!30936 m!143527))

(assert (=> b!98507 d!30936))

(assert (=> b!98507 d!30820))

(declare-fun d!30938 () Bool)

(declare-fun lt!143376 () tuple2!7966)

(assert (=> d!30938 (= lt!143376 (readBit!0 lt!142820))))

(assert (=> d!30938 (= (readBitPure!0 lt!142820) (tuple2!7955 (_2!4236 lt!143376) (_1!4236 lt!143376)))))

(declare-fun bs!7575 () Bool)

(assert (= bs!7575 d!30938))

(declare-fun m!143529 () Bool)

(assert (=> bs!7575 m!143529))

(assert (=> b!98507 d!30938))

(declare-fun b!98748 () Bool)

(declare-fun e!64574 () (_ BitVec 64))

(assert (=> b!98748 (= e!64574 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!98749 () Bool)

(declare-fun e!64576 () Bool)

(declare-fun lt!143384 () tuple2!7954)

(declare-fun lt!143380 () tuple2!7954)

(assert (=> b!98749 (= e!64576 (= (_2!4229 lt!143384) (_2!4229 lt!143380)))))

(declare-fun d!30940 () Bool)

(declare-fun e!64577 () Bool)

(assert (=> d!30940 e!64577))

(declare-fun res!80999 () Bool)

(assert (=> d!30940 (=> (not res!80999) (not e!64577))))

(declare-fun lt!143404 () tuple2!7936)

(assert (=> d!30940 (= res!80999 (= (size!2110 (buf!2461 (_2!4220 lt!142834))) (size!2110 (buf!2461 (_2!4220 lt!143404)))))))

(declare-fun e!64575 () tuple2!7936)

(assert (=> d!30940 (= lt!143404 e!64575)))

(declare-fun c!6249 () Bool)

(assert (=> d!30940 (= c!6249 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388))))

(assert (=> d!30940 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30940 (= (appendNLeastSignificantBitsLoop!0 (_2!4220 lt!142834) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!143404)))

(declare-fun b!98750 () Bool)

(declare-fun res!81006 () Bool)

(assert (=> b!98750 (=> (not res!81006) (not e!64577))))

(declare-fun lt!143414 () (_ BitVec 64))

(declare-fun lt!143412 () (_ BitVec 64))

(assert (=> b!98750 (= res!81006 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143404))) (currentByte!4891 (_2!4220 lt!143404)) (currentBit!4886 (_2!4220 lt!143404))) (bvadd lt!143412 lt!143414)))))

(assert (=> b!98750 (or (not (= (bvand lt!143412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143414 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143412 lt!143414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98750 (= lt!143414 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!98750 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98750 (= lt!143412 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))))))

(declare-fun b!98751 () Bool)

(declare-fun res!81007 () Bool)

(declare-fun lt!143396 () tuple2!7936)

(assert (=> b!98751 (= res!81007 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143396))) (currentByte!4891 (_2!4220 lt!143396)) (currentBit!4886 (_2!4220 lt!143396))) (bvadd (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!64571 () Bool)

(assert (=> b!98751 (=> (not res!81007) (not e!64571))))

(declare-fun b!98752 () Bool)

(declare-fun lt!143388 () tuple2!7936)

(declare-fun Unit!6057 () Unit!6029)

(assert (=> b!98752 (= e!64575 (tuple2!7937 Unit!6057 (_2!4220 lt!143388)))))

(declare-fun lt!143401 () Bool)

(assert (=> b!98752 (= lt!143401 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98752 (= lt!143396 (appendBit!0 (_2!4220 lt!142834) lt!143401))))

(declare-fun res!81003 () Bool)

(assert (=> b!98752 (= res!81003 (= (size!2110 (buf!2461 (_2!4220 lt!142834))) (size!2110 (buf!2461 (_2!4220 lt!143396)))))))

(assert (=> b!98752 (=> (not res!81003) (not e!64571))))

(assert (=> b!98752 e!64571))

(declare-fun lt!143403 () tuple2!7936)

(assert (=> b!98752 (= lt!143403 lt!143396)))

(assert (=> b!98752 (= lt!143388 (appendNLeastSignificantBitsLoop!0 (_2!4220 lt!143403) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!143411 () Unit!6029)

(assert (=> b!98752 (= lt!143411 (lemmaIsPrefixTransitive!0 (_2!4220 lt!142834) (_2!4220 lt!143403) (_2!4220 lt!143388)))))

(declare-fun call!1236 () Bool)

(assert (=> b!98752 call!1236))

(declare-fun lt!143399 () Unit!6029)

(assert (=> b!98752 (= lt!143399 lt!143411)))

(assert (=> b!98752 (invariant!0 (currentBit!4886 (_2!4220 lt!142834)) (currentByte!4891 (_2!4220 lt!142834)) (size!2110 (buf!2461 (_2!4220 lt!143403))))))

(declare-fun lt!143408 () BitStream!3694)

(assert (=> b!98752 (= lt!143408 (BitStream!3695 (buf!2461 (_2!4220 lt!143403)) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))))))

(assert (=> b!98752 (invariant!0 (currentBit!4886 lt!143408) (currentByte!4891 lt!143408) (size!2110 (buf!2461 (_2!4220 lt!143388))))))

(declare-fun lt!143389 () BitStream!3694)

(assert (=> b!98752 (= lt!143389 (BitStream!3695 (buf!2461 (_2!4220 lt!143388)) (currentByte!4891 lt!143408) (currentBit!4886 lt!143408)))))

(assert (=> b!98752 (= lt!143384 (readBitPure!0 lt!143408))))

(assert (=> b!98752 (= lt!143380 (readBitPure!0 lt!143389))))

(declare-fun lt!143416 () Unit!6029)

(assert (=> b!98752 (= lt!143416 (readBitPrefixLemma!0 lt!143408 (_2!4220 lt!143388)))))

(declare-fun res!81004 () Bool)

(assert (=> b!98752 (= res!81004 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!143384))) (currentByte!4891 (_1!4229 lt!143384)) (currentBit!4886 (_1!4229 lt!143384))) (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!143380))) (currentByte!4891 (_1!4229 lt!143380)) (currentBit!4886 (_1!4229 lt!143380)))))))

(assert (=> b!98752 (=> (not res!81004) (not e!64576))))

(assert (=> b!98752 e!64576))

(declare-fun lt!143419 () Unit!6029)

(assert (=> b!98752 (= lt!143419 lt!143416)))

(declare-fun lt!143393 () tuple2!7940)

(assert (=> b!98752 (= lt!143393 (reader!0 (_2!4220 lt!142834) (_2!4220 lt!143388)))))

(declare-fun lt!143402 () tuple2!7940)

(assert (=> b!98752 (= lt!143402 (reader!0 (_2!4220 lt!143403) (_2!4220 lt!143388)))))

(declare-fun lt!143413 () tuple2!7954)

(assert (=> b!98752 (= lt!143413 (readBitPure!0 (_1!4222 lt!143393)))))

(assert (=> b!98752 (= (_2!4229 lt!143413) lt!143401)))

(declare-fun lt!143391 () Unit!6029)

(declare-fun Unit!6058 () Unit!6029)

(assert (=> b!98752 (= lt!143391 Unit!6058)))

(declare-fun lt!143385 () (_ BitVec 64))

(assert (=> b!98752 (= lt!143385 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(declare-fun lt!143387 () (_ BitVec 64))

(assert (=> b!98752 (= lt!143387 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!143392 () Unit!6029)

(assert (=> b!98752 (= lt!143392 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4220 lt!142834) (buf!2461 (_2!4220 lt!143388)) lt!143387))))

(assert (=> b!98752 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!143388)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834))) lt!143387)))

(declare-fun lt!143406 () Unit!6029)

(assert (=> b!98752 (= lt!143406 lt!143392)))

(declare-fun lt!143386 () tuple2!7938)

(assert (=> b!98752 (= lt!143386 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!143393) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143385))))

(declare-fun lt!143383 () (_ BitVec 64))

(assert (=> b!98752 (= lt!143383 ((_ sign_extend 32) (bvsub (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!143377 () Unit!6029)

(assert (=> b!98752 (= lt!143377 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4220 lt!143403) (buf!2461 (_2!4220 lt!143388)) lt!143383))))

(assert (=> b!98752 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!143388)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!143403))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!143403))) lt!143383)))

(declare-fun lt!143421 () Unit!6029)

(assert (=> b!98752 (= lt!143421 lt!143377)))

(declare-fun lt!143398 () tuple2!7938)

(assert (=> b!98752 (= lt!143398 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!143402) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!143385 (ite (_2!4229 lt!143413) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!143390 () tuple2!7938)

(assert (=> b!98752 (= lt!143390 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!143393) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143385))))

(declare-fun c!6248 () Bool)

(assert (=> b!98752 (= c!6248 (_2!4229 (readBitPure!0 (_1!4222 lt!143393))))))

(declare-fun lt!143420 () tuple2!7938)

(assert (=> b!98752 (= lt!143420 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4222 lt!143393) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!143385 e!64574)))))

(declare-fun lt!143378 () Unit!6029)

(assert (=> b!98752 (= lt!143378 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4222 lt!143393) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143385))))

(assert (=> b!98752 (and (= (_2!4221 lt!143390) (_2!4221 lt!143420)) (= (_1!4221 lt!143390) (_1!4221 lt!143420)))))

(declare-fun lt!143409 () Unit!6029)

(assert (=> b!98752 (= lt!143409 lt!143378)))

(assert (=> b!98752 (= (_1!4222 lt!143393) (withMovedBitIndex!0 (_2!4222 lt!143393) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143388))) (currentByte!4891 (_2!4220 lt!143388)) (currentBit!4886 (_2!4220 lt!143388))))))))

(declare-fun lt!143394 () Unit!6029)

(declare-fun Unit!6059 () Unit!6029)

(assert (=> b!98752 (= lt!143394 Unit!6059)))

(assert (=> b!98752 (= (_1!4222 lt!143402) (withMovedBitIndex!0 (_2!4222 lt!143402) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143403))) (currentByte!4891 (_2!4220 lt!143403)) (currentBit!4886 (_2!4220 lt!143403))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143388))) (currentByte!4891 (_2!4220 lt!143388)) (currentBit!4886 (_2!4220 lt!143388))))))))

(declare-fun lt!143381 () Unit!6029)

(declare-fun Unit!6060 () Unit!6029)

(assert (=> b!98752 (= lt!143381 Unit!6060)))

(assert (=> b!98752 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143403))) (currentByte!4891 (_2!4220 lt!143403)) (currentBit!4886 (_2!4220 lt!143403))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!143407 () Unit!6029)

(declare-fun Unit!6061 () Unit!6029)

(assert (=> b!98752 (= lt!143407 Unit!6061)))

(assert (=> b!98752 (= (_2!4221 lt!143386) (_2!4221 lt!143398))))

(declare-fun lt!143395 () Unit!6029)

(declare-fun Unit!6062 () Unit!6029)

(assert (=> b!98752 (= lt!143395 Unit!6062)))

(assert (=> b!98752 (= (_1!4221 lt!143386) (_2!4222 lt!143393))))

(declare-fun b!98753 () Bool)

(declare-fun lt!143405 () Unit!6029)

(assert (=> b!98753 (= e!64575 (tuple2!7937 lt!143405 (_2!4220 lt!142834)))))

(declare-fun lt!143400 () BitStream!3694)

(assert (=> b!98753 (= lt!143400 (_2!4220 lt!142834))))

(assert (=> b!98753 (= lt!143405 (lemmaIsPrefixRefl!0 lt!143400))))

(assert (=> b!98753 call!1236))

(declare-fun b!98754 () Bool)

(declare-fun e!64573 () Bool)

(declare-fun lt!143418 () (_ BitVec 64))

(assert (=> b!98754 (= e!64573 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142834)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834))) lt!143418))))

(declare-fun b!98755 () Bool)

(declare-fun e!64572 () Bool)

(declare-fun lt!143417 () tuple2!7954)

(assert (=> b!98755 (= e!64572 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!143417))) (currentByte!4891 (_1!4229 lt!143417)) (currentBit!4886 (_1!4229 lt!143417))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!143396))) (currentByte!4891 (_2!4220 lt!143396)) (currentBit!4886 (_2!4220 lt!143396)))))))

(declare-fun b!98756 () Bool)

(assert (=> b!98756 (= e!64574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1233 () Bool)

(assert (=> bm!1233 (= call!1236 (isPrefixOf!0 (ite c!6249 (_2!4220 lt!142834) lt!143400) (ite c!6249 (_2!4220 lt!143388) lt!143400)))))

(declare-fun b!98757 () Bool)

(assert (=> b!98757 (= lt!143417 (readBitPure!0 (readerFrom!0 (_2!4220 lt!143396) (currentBit!4886 (_2!4220 lt!142834)) (currentByte!4891 (_2!4220 lt!142834)))))))

(declare-fun res!81001 () Bool)

(assert (=> b!98757 (= res!81001 (and (= (_2!4229 lt!143417) lt!143401) (= (_1!4229 lt!143417) (_2!4220 lt!143396))))))

(assert (=> b!98757 (=> (not res!81001) (not e!64572))))

(assert (=> b!98757 (= e!64571 e!64572)))

(declare-fun b!98758 () Bool)

(declare-fun res!81005 () Bool)

(assert (=> b!98758 (= res!81005 (isPrefixOf!0 (_2!4220 lt!142834) (_2!4220 lt!143396)))))

(assert (=> b!98758 (=> (not res!81005) (not e!64571))))

(declare-fun b!98759 () Bool)

(declare-fun res!81002 () Bool)

(assert (=> b!98759 (=> (not res!81002) (not e!64577))))

(assert (=> b!98759 (= res!81002 (isPrefixOf!0 (_2!4220 lt!142834) (_2!4220 lt!143404)))))

(declare-fun b!98760 () Bool)

(declare-fun lt!143415 () tuple2!7940)

(declare-fun lt!143410 () tuple2!7938)

(assert (=> b!98760 (= e!64577 (and (= (_2!4221 lt!143410) v!196) (= (_1!4221 lt!143410) (_2!4222 lt!143415))))))

(declare-fun lt!143379 () (_ BitVec 64))

(assert (=> b!98760 (= lt!143410 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!143415) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143379))))

(declare-fun lt!143382 () Unit!6029)

(declare-fun lt!143397 () Unit!6029)

(assert (=> b!98760 (= lt!143382 lt!143397)))

(assert (=> b!98760 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!143404)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834))) lt!143418)))

(assert (=> b!98760 (= lt!143397 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4220 lt!142834) (buf!2461 (_2!4220 lt!143404)) lt!143418))))

(assert (=> b!98760 e!64573))

(declare-fun res!81000 () Bool)

(assert (=> b!98760 (=> (not res!81000) (not e!64573))))

(assert (=> b!98760 (= res!81000 (and (= (size!2110 (buf!2461 (_2!4220 lt!142834))) (size!2110 (buf!2461 (_2!4220 lt!143404)))) (bvsge lt!143418 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98760 (= lt!143418 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!98760 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98760 (= lt!143379 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(assert (=> b!98760 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98760 (= lt!143415 (reader!0 (_2!4220 lt!142834) (_2!4220 lt!143404)))))

(assert (= (and d!30940 c!6249) b!98752))

(assert (= (and d!30940 (not c!6249)) b!98753))

(assert (= (and b!98752 res!81003) b!98751))

(assert (= (and b!98751 res!81007) b!98758))

(assert (= (and b!98758 res!81005) b!98757))

(assert (= (and b!98757 res!81001) b!98755))

(assert (= (and b!98752 res!81004) b!98749))

(assert (= (and b!98752 c!6248) b!98748))

(assert (= (and b!98752 (not c!6248)) b!98756))

(assert (= (or b!98752 b!98753) bm!1233))

(assert (= (and d!30940 res!80999) b!98750))

(assert (= (and b!98750 res!81006) b!98759))

(assert (= (and b!98759 res!81002) b!98760))

(assert (= (and b!98760 res!81000) b!98754))

(declare-fun m!143531 () Bool)

(assert (=> b!98757 m!143531))

(assert (=> b!98757 m!143531))

(declare-fun m!143533 () Bool)

(assert (=> b!98757 m!143533))

(declare-fun m!143535 () Bool)

(assert (=> b!98753 m!143535))

(declare-fun m!143537 () Bool)

(assert (=> b!98752 m!143537))

(declare-fun m!143539 () Bool)

(assert (=> b!98752 m!143539))

(declare-fun m!143541 () Bool)

(assert (=> b!98752 m!143541))

(declare-fun m!143543 () Bool)

(assert (=> b!98752 m!143543))

(declare-fun m!143545 () Bool)

(assert (=> b!98752 m!143545))

(declare-fun m!143547 () Bool)

(assert (=> b!98752 m!143547))

(declare-fun m!143549 () Bool)

(assert (=> b!98752 m!143549))

(declare-fun m!143551 () Bool)

(assert (=> b!98752 m!143551))

(declare-fun m!143553 () Bool)

(assert (=> b!98752 m!143553))

(declare-fun m!143555 () Bool)

(assert (=> b!98752 m!143555))

(assert (=> b!98752 m!143081))

(declare-fun m!143557 () Bool)

(assert (=> b!98752 m!143557))

(declare-fun m!143559 () Bool)

(assert (=> b!98752 m!143559))

(declare-fun m!143561 () Bool)

(assert (=> b!98752 m!143561))

(declare-fun m!143563 () Bool)

(assert (=> b!98752 m!143563))

(declare-fun m!143565 () Bool)

(assert (=> b!98752 m!143565))

(declare-fun m!143567 () Bool)

(assert (=> b!98752 m!143567))

(declare-fun m!143569 () Bool)

(assert (=> b!98752 m!143569))

(declare-fun m!143571 () Bool)

(assert (=> b!98752 m!143571))

(declare-fun m!143573 () Bool)

(assert (=> b!98752 m!143573))

(declare-fun m!143575 () Bool)

(assert (=> b!98752 m!143575))

(declare-fun m!143577 () Bool)

(assert (=> b!98752 m!143577))

(declare-fun m!143579 () Bool)

(assert (=> b!98752 m!143579))

(declare-fun m!143581 () Bool)

(assert (=> b!98752 m!143581))

(declare-fun m!143583 () Bool)

(assert (=> b!98752 m!143583))

(declare-fun m!143585 () Bool)

(assert (=> b!98752 m!143585))

(declare-fun m!143587 () Bool)

(assert (=> b!98752 m!143587))

(assert (=> b!98752 m!143563))

(declare-fun m!143589 () Bool)

(assert (=> b!98752 m!143589))

(declare-fun m!143591 () Bool)

(assert (=> b!98750 m!143591))

(assert (=> b!98750 m!143081))

(declare-fun m!143593 () Bool)

(assert (=> b!98754 m!143593))

(declare-fun m!143595 () Bool)

(assert (=> b!98755 m!143595))

(declare-fun m!143597 () Bool)

(assert (=> b!98755 m!143597))

(declare-fun m!143599 () Bool)

(assert (=> b!98759 m!143599))

(assert (=> b!98751 m!143597))

(assert (=> b!98751 m!143081))

(declare-fun m!143601 () Bool)

(assert (=> b!98760 m!143601))

(assert (=> b!98760 m!143547))

(declare-fun m!143603 () Bool)

(assert (=> b!98760 m!143603))

(declare-fun m!143605 () Bool)

(assert (=> b!98760 m!143605))

(declare-fun m!143607 () Bool)

(assert (=> b!98760 m!143607))

(declare-fun m!143609 () Bool)

(assert (=> bm!1233 m!143609))

(declare-fun m!143611 () Bool)

(assert (=> b!98758 m!143611))

(assert (=> b!98507 d!30940))

(declare-fun lt!143422 () (_ BitVec 64))

(declare-fun b!98761 () Bool)

(declare-fun e!64579 () Bool)

(declare-fun lt!143424 () tuple2!7940)

(declare-fun lt!143433 () (_ BitVec 64))

(assert (=> b!98761 (= e!64579 (= (_1!4222 lt!143424) (withMovedBitIndex!0 (_2!4222 lt!143424) (bvsub lt!143433 lt!143422))))))

(assert (=> b!98761 (or (= (bvand lt!143433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143422 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143433 lt!143422) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98761 (= lt!143422 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))))

(assert (=> b!98761 (= lt!143433 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))))))

(declare-fun b!98762 () Bool)

(declare-fun res!81010 () Bool)

(assert (=> b!98762 (=> (not res!81010) (not e!64579))))

(assert (=> b!98762 (= res!81010 (isPrefixOf!0 (_2!4222 lt!143424) (_2!4220 lt!142819)))))

(declare-fun d!30942 () Bool)

(assert (=> d!30942 e!64579))

(declare-fun res!81009 () Bool)

(assert (=> d!30942 (=> (not res!81009) (not e!64579))))

(assert (=> d!30942 (= res!81009 (isPrefixOf!0 (_1!4222 lt!143424) (_2!4222 lt!143424)))))

(declare-fun lt!143428 () BitStream!3694)

(assert (=> d!30942 (= lt!143424 (tuple2!7941 lt!143428 (_2!4220 lt!142819)))))

(declare-fun lt!143423 () Unit!6029)

(declare-fun lt!143430 () Unit!6029)

(assert (=> d!30942 (= lt!143423 lt!143430)))

(assert (=> d!30942 (isPrefixOf!0 lt!143428 (_2!4220 lt!142819))))

(assert (=> d!30942 (= lt!143430 (lemmaIsPrefixTransitive!0 lt!143428 (_2!4220 lt!142819) (_2!4220 lt!142819)))))

(declare-fun lt!143432 () Unit!6029)

(declare-fun lt!143441 () Unit!6029)

(assert (=> d!30942 (= lt!143432 lt!143441)))

(assert (=> d!30942 (isPrefixOf!0 lt!143428 (_2!4220 lt!142819))))

(assert (=> d!30942 (= lt!143441 (lemmaIsPrefixTransitive!0 lt!143428 (_2!4220 lt!142834) (_2!4220 lt!142819)))))

(declare-fun lt!143425 () Unit!6029)

(declare-fun e!64578 () Unit!6029)

(assert (=> d!30942 (= lt!143425 e!64578)))

(declare-fun c!6250 () Bool)

(assert (=> d!30942 (= c!6250 (not (= (size!2110 (buf!2461 (_2!4220 lt!142834))) #b00000000000000000000000000000000)))))

(declare-fun lt!143435 () Unit!6029)

(declare-fun lt!143426 () Unit!6029)

(assert (=> d!30942 (= lt!143435 lt!143426)))

(assert (=> d!30942 (isPrefixOf!0 (_2!4220 lt!142819) (_2!4220 lt!142819))))

(assert (=> d!30942 (= lt!143426 (lemmaIsPrefixRefl!0 (_2!4220 lt!142819)))))

(declare-fun lt!143437 () Unit!6029)

(declare-fun lt!143436 () Unit!6029)

(assert (=> d!30942 (= lt!143437 lt!143436)))

(assert (=> d!30942 (= lt!143436 (lemmaIsPrefixRefl!0 (_2!4220 lt!142819)))))

(declare-fun lt!143439 () Unit!6029)

(declare-fun lt!143431 () Unit!6029)

(assert (=> d!30942 (= lt!143439 lt!143431)))

(assert (=> d!30942 (isPrefixOf!0 lt!143428 lt!143428)))

(assert (=> d!30942 (= lt!143431 (lemmaIsPrefixRefl!0 lt!143428))))

(declare-fun lt!143440 () Unit!6029)

(declare-fun lt!143427 () Unit!6029)

(assert (=> d!30942 (= lt!143440 lt!143427)))

(assert (=> d!30942 (isPrefixOf!0 (_2!4220 lt!142834) (_2!4220 lt!142834))))

(assert (=> d!30942 (= lt!143427 (lemmaIsPrefixRefl!0 (_2!4220 lt!142834)))))

(assert (=> d!30942 (= lt!143428 (BitStream!3695 (buf!2461 (_2!4220 lt!142819)) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))))))

(assert (=> d!30942 (isPrefixOf!0 (_2!4220 lt!142834) (_2!4220 lt!142819))))

(assert (=> d!30942 (= (reader!0 (_2!4220 lt!142834) (_2!4220 lt!142819)) lt!143424)))

(declare-fun b!98763 () Bool)

(declare-fun res!81008 () Bool)

(assert (=> b!98763 (=> (not res!81008) (not e!64579))))

(assert (=> b!98763 (= res!81008 (isPrefixOf!0 (_1!4222 lt!143424) (_2!4220 lt!142834)))))

(declare-fun b!98764 () Bool)

(declare-fun Unit!6063 () Unit!6029)

(assert (=> b!98764 (= e!64578 Unit!6063)))

(declare-fun b!98765 () Bool)

(declare-fun lt!143438 () Unit!6029)

(assert (=> b!98765 (= e!64578 lt!143438)))

(declare-fun lt!143429 () (_ BitVec 64))

(assert (=> b!98765 (= lt!143429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143434 () (_ BitVec 64))

(assert (=> b!98765 (= lt!143434 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))))))

(assert (=> b!98765 (= lt!143438 (arrayBitRangesEqSymmetric!0 (buf!2461 (_2!4220 lt!142834)) (buf!2461 (_2!4220 lt!142819)) lt!143429 lt!143434))))

(assert (=> b!98765 (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142819)) (buf!2461 (_2!4220 lt!142834)) lt!143429 lt!143434)))

(assert (= (and d!30942 c!6250) b!98765))

(assert (= (and d!30942 (not c!6250)) b!98764))

(assert (= (and d!30942 res!81009) b!98763))

(assert (= (and b!98763 res!81008) b!98762))

(assert (= (and b!98762 res!81010) b!98761))

(declare-fun m!143613 () Bool)

(assert (=> d!30942 m!143613))

(declare-fun m!143615 () Bool)

(assert (=> d!30942 m!143615))

(declare-fun m!143617 () Bool)

(assert (=> d!30942 m!143617))

(declare-fun m!143619 () Bool)

(assert (=> d!30942 m!143619))

(declare-fun m!143621 () Bool)

(assert (=> d!30942 m!143621))

(declare-fun m!143623 () Bool)

(assert (=> d!30942 m!143623))

(declare-fun m!143625 () Bool)

(assert (=> d!30942 m!143625))

(declare-fun m!143627 () Bool)

(assert (=> d!30942 m!143627))

(declare-fun m!143629 () Bool)

(assert (=> d!30942 m!143629))

(declare-fun m!143631 () Bool)

(assert (=> d!30942 m!143631))

(declare-fun m!143633 () Bool)

(assert (=> d!30942 m!143633))

(declare-fun m!143635 () Bool)

(assert (=> b!98762 m!143635))

(declare-fun m!143637 () Bool)

(assert (=> b!98761 m!143637))

(assert (=> b!98761 m!143053))

(assert (=> b!98761 m!143081))

(assert (=> b!98765 m!143081))

(declare-fun m!143639 () Bool)

(assert (=> b!98765 m!143639))

(declare-fun m!143641 () Bool)

(assert (=> b!98765 m!143641))

(declare-fun m!143643 () Bool)

(assert (=> b!98763 m!143643))

(assert (=> b!98507 d!30942))

(declare-fun d!30944 () Bool)

(declare-fun lt!143442 () tuple2!7960)

(assert (=> d!30944 (= lt!143442 (readNLeastSignificantBitsLoop!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816))))

(assert (=> d!30944 (= (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816) (tuple2!7939 (_2!4232 lt!143442) (_1!4232 lt!143442)))))

(declare-fun bs!7576 () Bool)

(assert (= bs!7576 d!30944))

(declare-fun m!143645 () Bool)

(assert (=> bs!7576 m!143645))

(assert (=> b!98507 d!30944))

(declare-fun d!30946 () Bool)

(declare-fun e!64580 () Bool)

(assert (=> d!30946 e!64580))

(declare-fun res!81011 () Bool)

(assert (=> d!30946 (=> (not res!81011) (not e!64580))))

(declare-fun lt!143443 () BitStream!3694)

(declare-fun lt!143444 () (_ BitVec 64))

(assert (=> d!30946 (= res!81011 (= (bvadd lt!143444 (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))) (bitIndex!0 (size!2110 (buf!2461 lt!143443)) (currentByte!4891 lt!143443) (currentBit!4886 lt!143443))))))

(assert (=> d!30946 (or (not (= (bvand lt!143444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143444 (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30946 (= lt!143444 (bitIndex!0 (size!2110 (buf!2461 (_2!4222 lt!142824))) (currentByte!4891 (_2!4222 lt!142824)) (currentBit!4886 (_2!4222 lt!142824))))))

(assert (=> d!30946 (= lt!143443 (_2!4220 (moveBitIndex!0 (_2!4222 lt!142824) (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819)))))))))

(assert (=> d!30946 (moveBitIndexPrecond!0 (_2!4222 lt!142824) (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819)))))))

(assert (=> d!30946 (= (withMovedBitIndex!0 (_2!4222 lt!142824) (bvsub (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))) lt!143443)))

(declare-fun b!98766 () Bool)

(assert (=> b!98766 (= e!64580 (= (size!2110 (buf!2461 (_2!4222 lt!142824))) (size!2110 (buf!2461 lt!143443))))))

(assert (= (and d!30946 res!81011) b!98766))

(declare-fun m!143647 () Bool)

(assert (=> d!30946 m!143647))

(declare-fun m!143649 () Bool)

(assert (=> d!30946 m!143649))

(declare-fun m!143651 () Bool)

(assert (=> d!30946 m!143651))

(declare-fun m!143653 () Bool)

(assert (=> d!30946 m!143653))

(assert (=> b!98507 d!30946))

(declare-fun d!30948 () Bool)

(assert (=> d!30948 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142818) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) lt!142818))))

(declare-fun bs!7577 () Bool)

(assert (= bs!7577 d!30948))

(declare-fun m!143655 () Bool)

(assert (=> bs!7577 m!143655))

(assert (=> b!98507 d!30948))

(declare-fun d!30950 () Bool)

(assert (=> d!30950 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834))) lt!142814) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834)))) lt!142814))))

(declare-fun bs!7578 () Bool)

(assert (= bs!7578 d!30950))

(declare-fun m!143657 () Bool)

(assert (=> bs!7578 m!143657))

(assert (=> b!98507 d!30950))

(declare-fun d!30952 () Bool)

(declare-fun e!64581 () Bool)

(assert (=> d!30952 e!64581))

(declare-fun res!81013 () Bool)

(assert (=> d!30952 (=> (not res!81013) (not e!64581))))

(declare-fun lt!143450 () (_ BitVec 64))

(declare-fun lt!143445 () (_ BitVec 64))

(declare-fun lt!143446 () (_ BitVec 64))

(assert (=> d!30952 (= res!81013 (= lt!143450 (bvsub lt!143445 lt!143446)))))

(assert (=> d!30952 (or (= (bvand lt!143445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143445 lt!143446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30952 (= lt!143446 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142819))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142819)))))))

(declare-fun lt!143448 () (_ BitVec 64))

(declare-fun lt!143449 () (_ BitVec 64))

(assert (=> d!30952 (= lt!143445 (bvmul lt!143448 lt!143449))))

(assert (=> d!30952 (or (= lt!143448 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143449 (bvsdiv (bvmul lt!143448 lt!143449) lt!143448)))))

(assert (=> d!30952 (= lt!143449 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30952 (= lt!143448 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))))))

(assert (=> d!30952 (= lt!143450 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142819))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142819)))))))

(assert (=> d!30952 (invariant!0 (currentBit!4886 (_2!4220 lt!142819)) (currentByte!4891 (_2!4220 lt!142819)) (size!2110 (buf!2461 (_2!4220 lt!142819))))))

(assert (=> d!30952 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))) lt!143450)))

(declare-fun b!98767 () Bool)

(declare-fun res!81012 () Bool)

(assert (=> b!98767 (=> (not res!81012) (not e!64581))))

(assert (=> b!98767 (= res!81012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143450))))

(declare-fun b!98768 () Bool)

(declare-fun lt!143447 () (_ BitVec 64))

(assert (=> b!98768 (= e!64581 (bvsle lt!143450 (bvmul lt!143447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98768 (or (= lt!143447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143447)))))

(assert (=> b!98768 (= lt!143447 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))))))

(assert (= (and d!30952 res!81013) b!98767))

(assert (= (and b!98767 res!81012) b!98768))

(declare-fun m!143659 () Bool)

(assert (=> d!30952 m!143659))

(declare-fun m!143661 () Bool)

(assert (=> d!30952 m!143661))

(assert (=> b!98507 d!30952))

(declare-fun d!30954 () Bool)

(declare-fun e!64582 () Bool)

(assert (=> d!30954 e!64582))

(declare-fun res!81015 () Bool)

(assert (=> d!30954 (=> (not res!81015) (not e!64582))))

(declare-fun lt!143456 () (_ BitVec 64))

(declare-fun lt!143451 () (_ BitVec 64))

(declare-fun lt!143452 () (_ BitVec 64))

(assert (=> d!30954 (= res!81015 (= lt!143456 (bvsub lt!143451 lt!143452)))))

(assert (=> d!30954 (or (= (bvand lt!143451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143451 lt!143452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30954 (= lt!143452 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142834)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834)))))))

(declare-fun lt!143454 () (_ BitVec 64))

(declare-fun lt!143455 () (_ BitVec 64))

(assert (=> d!30954 (= lt!143451 (bvmul lt!143454 lt!143455))))

(assert (=> d!30954 (or (= lt!143454 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143455 (bvsdiv (bvmul lt!143454 lt!143455) lt!143454)))))

(assert (=> d!30954 (= lt!143455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30954 (= lt!143454 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142834)))))))

(assert (=> d!30954 (= lt!143456 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142834)))))))

(assert (=> d!30954 (invariant!0 (currentBit!4886 (_2!4220 lt!142834)) (currentByte!4891 (_2!4220 lt!142834)) (size!2110 (buf!2461 (_2!4220 lt!142834))))))

(assert (=> d!30954 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) lt!143456)))

(declare-fun b!98769 () Bool)

(declare-fun res!81014 () Bool)

(assert (=> b!98769 (=> (not res!81014) (not e!64582))))

(assert (=> b!98769 (= res!81014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143456))))

(declare-fun b!98770 () Bool)

(declare-fun lt!143453 () (_ BitVec 64))

(assert (=> b!98770 (= e!64582 (bvsle lt!143456 (bvmul lt!143453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98770 (or (= lt!143453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143453)))))

(assert (=> b!98770 (= lt!143453 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142834)))))))

(assert (= (and d!30954 res!81015) b!98769))

(assert (= (and b!98769 res!81014) b!98770))

(declare-fun m!143663 () Bool)

(assert (=> d!30954 m!143663))

(declare-fun m!143665 () Bool)

(assert (=> d!30954 m!143665))

(assert (=> b!98507 d!30954))

(declare-fun d!30956 () Bool)

(declare-fun lt!143457 () tuple2!7966)

(assert (=> d!30956 (= lt!143457 (readBit!0 lt!142839))))

(assert (=> d!30956 (= (readBitPure!0 lt!142839) (tuple2!7955 (_2!4236 lt!143457) (_1!4236 lt!143457)))))

(declare-fun bs!7579 () Bool)

(assert (= bs!7579 d!30956))

(declare-fun m!143667 () Bool)

(assert (=> bs!7579 m!143667))

(assert (=> b!98507 d!30956))

(declare-fun d!30958 () Bool)

(declare-fun lt!143458 () tuple2!7960)

(assert (=> d!30958 (= lt!143458 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142816 e!64430)))))

(assert (=> d!30958 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142816 e!64430)) (tuple2!7939 (_2!4232 lt!143458) (_1!4232 lt!143458)))))

(declare-fun bs!7580 () Bool)

(assert (= bs!7580 d!30958))

(assert (=> bs!7580 m!143065))

(declare-fun m!143669 () Bool)

(assert (=> bs!7580 m!143669))

(assert (=> b!98507 d!30958))

(declare-fun e!64584 () Bool)

(declare-fun lt!143459 () (_ BitVec 64))

(declare-fun b!98771 () Bool)

(declare-fun lt!143470 () (_ BitVec 64))

(declare-fun lt!143461 () tuple2!7940)

(assert (=> b!98771 (= e!64584 (= (_1!4222 lt!143461) (withMovedBitIndex!0 (_2!4222 lt!143461) (bvsub lt!143470 lt!143459))))))

(assert (=> b!98771 (or (= (bvand lt!143470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143470 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143470 lt!143459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98771 (= lt!143459 (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))))

(assert (=> b!98771 (= lt!143470 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(declare-fun b!98772 () Bool)

(declare-fun res!81018 () Bool)

(assert (=> b!98772 (=> (not res!81018) (not e!64584))))

(assert (=> b!98772 (= res!81018 (isPrefixOf!0 (_2!4222 lt!143461) (_2!4220 lt!142819)))))

(declare-fun d!30960 () Bool)

(assert (=> d!30960 e!64584))

(declare-fun res!81017 () Bool)

(assert (=> d!30960 (=> (not res!81017) (not e!64584))))

(assert (=> d!30960 (= res!81017 (isPrefixOf!0 (_1!4222 lt!143461) (_2!4222 lt!143461)))))

(declare-fun lt!143465 () BitStream!3694)

(assert (=> d!30960 (= lt!143461 (tuple2!7941 lt!143465 (_2!4220 lt!142819)))))

(declare-fun lt!143460 () Unit!6029)

(declare-fun lt!143467 () Unit!6029)

(assert (=> d!30960 (= lt!143460 lt!143467)))

(assert (=> d!30960 (isPrefixOf!0 lt!143465 (_2!4220 lt!142819))))

(assert (=> d!30960 (= lt!143467 (lemmaIsPrefixTransitive!0 lt!143465 (_2!4220 lt!142819) (_2!4220 lt!142819)))))

(declare-fun lt!143469 () Unit!6029)

(declare-fun lt!143478 () Unit!6029)

(assert (=> d!30960 (= lt!143469 lt!143478)))

(assert (=> d!30960 (isPrefixOf!0 lt!143465 (_2!4220 lt!142819))))

(assert (=> d!30960 (= lt!143478 (lemmaIsPrefixTransitive!0 lt!143465 thiss!1288 (_2!4220 lt!142819)))))

(declare-fun lt!143462 () Unit!6029)

(declare-fun e!64583 () Unit!6029)

(assert (=> d!30960 (= lt!143462 e!64583)))

(declare-fun c!6251 () Bool)

(assert (=> d!30960 (= c!6251 (not (= (size!2110 (buf!2461 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143472 () Unit!6029)

(declare-fun lt!143463 () Unit!6029)

(assert (=> d!30960 (= lt!143472 lt!143463)))

(assert (=> d!30960 (isPrefixOf!0 (_2!4220 lt!142819) (_2!4220 lt!142819))))

(assert (=> d!30960 (= lt!143463 (lemmaIsPrefixRefl!0 (_2!4220 lt!142819)))))

(declare-fun lt!143474 () Unit!6029)

(declare-fun lt!143473 () Unit!6029)

(assert (=> d!30960 (= lt!143474 lt!143473)))

(assert (=> d!30960 (= lt!143473 (lemmaIsPrefixRefl!0 (_2!4220 lt!142819)))))

(declare-fun lt!143476 () Unit!6029)

(declare-fun lt!143468 () Unit!6029)

(assert (=> d!30960 (= lt!143476 lt!143468)))

(assert (=> d!30960 (isPrefixOf!0 lt!143465 lt!143465)))

(assert (=> d!30960 (= lt!143468 (lemmaIsPrefixRefl!0 lt!143465))))

(declare-fun lt!143477 () Unit!6029)

(declare-fun lt!143464 () Unit!6029)

(assert (=> d!30960 (= lt!143477 lt!143464)))

(assert (=> d!30960 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30960 (= lt!143464 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30960 (= lt!143465 (BitStream!3695 (buf!2461 (_2!4220 lt!142819)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (=> d!30960 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142819))))

(assert (=> d!30960 (= (reader!0 thiss!1288 (_2!4220 lt!142819)) lt!143461)))

(declare-fun b!98773 () Bool)

(declare-fun res!81016 () Bool)

(assert (=> b!98773 (=> (not res!81016) (not e!64584))))

(assert (=> b!98773 (= res!81016 (isPrefixOf!0 (_1!4222 lt!143461) thiss!1288))))

(declare-fun b!98774 () Bool)

(declare-fun Unit!6064 () Unit!6029)

(assert (=> b!98774 (= e!64583 Unit!6064)))

(declare-fun b!98775 () Bool)

(declare-fun lt!143475 () Unit!6029)

(assert (=> b!98775 (= e!64583 lt!143475)))

(declare-fun lt!143466 () (_ BitVec 64))

(assert (=> b!98775 (= lt!143466 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143471 () (_ BitVec 64))

(assert (=> b!98775 (= lt!143471 (bitIndex!0 (size!2110 (buf!2461 thiss!1288)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288)))))

(assert (=> b!98775 (= lt!143475 (arrayBitRangesEqSymmetric!0 (buf!2461 thiss!1288) (buf!2461 (_2!4220 lt!142819)) lt!143466 lt!143471))))

(assert (=> b!98775 (arrayBitRangesEq!0 (buf!2461 (_2!4220 lt!142819)) (buf!2461 thiss!1288) lt!143466 lt!143471)))

(assert (= (and d!30960 c!6251) b!98775))

(assert (= (and d!30960 (not c!6251)) b!98774))

(assert (= (and d!30960 res!81017) b!98773))

(assert (= (and b!98773 res!81016) b!98772))

(assert (= (and b!98772 res!81018) b!98771))

(assert (=> d!30960 m!143613))

(assert (=> d!30960 m!143223))

(assert (=> d!30960 m!143617))

(declare-fun m!143671 () Bool)

(assert (=> d!30960 m!143671))

(assert (=> d!30960 m!143229))

(declare-fun m!143673 () Bool)

(assert (=> d!30960 m!143673))

(declare-fun m!143675 () Bool)

(assert (=> d!30960 m!143675))

(declare-fun m!143677 () Bool)

(assert (=> d!30960 m!143677))

(declare-fun m!143679 () Bool)

(assert (=> d!30960 m!143679))

(declare-fun m!143681 () Bool)

(assert (=> d!30960 m!143681))

(declare-fun m!143683 () Bool)

(assert (=> d!30960 m!143683))

(declare-fun m!143685 () Bool)

(assert (=> b!98772 m!143685))

(declare-fun m!143687 () Bool)

(assert (=> b!98771 m!143687))

(assert (=> b!98771 m!143053))

(assert (=> b!98771 m!142943))

(assert (=> b!98775 m!142943))

(declare-fun m!143689 () Bool)

(assert (=> b!98775 m!143689))

(declare-fun m!143691 () Bool)

(assert (=> b!98775 m!143691))

(declare-fun m!143693 () Bool)

(assert (=> b!98773 m!143693))

(assert (=> b!98507 d!30960))

(declare-fun lt!143479 () tuple2!7960)

(declare-fun d!30962 () Bool)

(assert (=> d!30962 (= lt!143479 (readNLeastSignificantBitsLoop!0 (_1!4222 lt!142833) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142816 (ite (_2!4229 lt!142844) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!30962 (= (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142833) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!142816 (ite (_2!4229 lt!142844) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!7939 (_2!4232 lt!143479) (_1!4232 lt!143479)))))

(declare-fun bs!7581 () Bool)

(assert (= bs!7581 d!30962))

(declare-fun m!143695 () Bool)

(assert (=> bs!7581 m!143695))

(assert (=> b!98507 d!30962))

(declare-fun d!30964 () Bool)

(declare-fun e!64587 () Bool)

(assert (=> d!30964 e!64587))

(declare-fun res!81021 () Bool)

(assert (=> d!30964 (=> (not res!81021) (not e!64587))))

(declare-fun lt!143488 () tuple2!7954)

(declare-fun lt!143491 () tuple2!7954)

(assert (=> d!30964 (= res!81021 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!143488))) (currentByte!4891 (_1!4229 lt!143488)) (currentBit!4886 (_1!4229 lt!143488))) (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!143491))) (currentByte!4891 (_1!4229 lt!143491)) (currentBit!4886 (_1!4229 lt!143491)))))))

(declare-fun lt!143489 () Unit!6029)

(declare-fun lt!143490 () BitStream!3694)

(declare-fun choose!50 (BitStream!3694 BitStream!3694 BitStream!3694 tuple2!7954 tuple2!7954 BitStream!3694 Bool tuple2!7954 tuple2!7954 BitStream!3694 Bool) Unit!6029)

(assert (=> d!30964 (= lt!143489 (choose!50 lt!142839 (_2!4220 lt!142819) lt!143490 lt!143488 (tuple2!7955 (_1!4229 lt!143488) (_2!4229 lt!143488)) (_1!4229 lt!143488) (_2!4229 lt!143488) lt!143491 (tuple2!7955 (_1!4229 lt!143491) (_2!4229 lt!143491)) (_1!4229 lt!143491) (_2!4229 lt!143491)))))

(assert (=> d!30964 (= lt!143491 (readBitPure!0 lt!143490))))

(assert (=> d!30964 (= lt!143488 (readBitPure!0 lt!142839))))

(assert (=> d!30964 (= lt!143490 (BitStream!3695 (buf!2461 (_2!4220 lt!142819)) (currentByte!4891 lt!142839) (currentBit!4886 lt!142839)))))

(assert (=> d!30964 (invariant!0 (currentBit!4886 lt!142839) (currentByte!4891 lt!142839) (size!2110 (buf!2461 (_2!4220 lt!142819))))))

(assert (=> d!30964 (= (readBitPrefixLemma!0 lt!142839 (_2!4220 lt!142819)) lt!143489)))

(declare-fun b!98778 () Bool)

(assert (=> b!98778 (= e!64587 (= (_2!4229 lt!143488) (_2!4229 lt!143491)))))

(assert (= (and d!30964 res!81021) b!98778))

(declare-fun m!143697 () Bool)

(assert (=> d!30964 m!143697))

(declare-fun m!143699 () Bool)

(assert (=> d!30964 m!143699))

(assert (=> d!30964 m!143041))

(declare-fun m!143701 () Bool)

(assert (=> d!30964 m!143701))

(assert (=> d!30964 m!143055))

(declare-fun m!143703 () Bool)

(assert (=> d!30964 m!143703))

(assert (=> b!98507 d!30964))

(declare-fun d!30966 () Bool)

(declare-fun e!64588 () Bool)

(assert (=> d!30966 e!64588))

(declare-fun res!81023 () Bool)

(assert (=> d!30966 (=> (not res!81023) (not e!64588))))

(declare-fun lt!143493 () (_ BitVec 64))

(declare-fun lt!143497 () (_ BitVec 64))

(declare-fun lt!143492 () (_ BitVec 64))

(assert (=> d!30966 (= res!81023 (= lt!143497 (bvsub lt!143492 lt!143493)))))

(assert (=> d!30966 (or (= (bvand lt!143492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143492 lt!143493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30966 (= lt!143493 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142815)))) ((_ sign_extend 32) (currentByte!4891 (_1!4229 lt!142815))) ((_ sign_extend 32) (currentBit!4886 (_1!4229 lt!142815)))))))

(declare-fun lt!143495 () (_ BitVec 64))

(declare-fun lt!143496 () (_ BitVec 64))

(assert (=> d!30966 (= lt!143492 (bvmul lt!143495 lt!143496))))

(assert (=> d!30966 (or (= lt!143495 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143496 (bvsdiv (bvmul lt!143495 lt!143496) lt!143495)))))

(assert (=> d!30966 (= lt!143496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30966 (= lt!143495 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142815)))))))

(assert (=> d!30966 (= lt!143497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_1!4229 lt!142815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_1!4229 lt!142815)))))))

(assert (=> d!30966 (invariant!0 (currentBit!4886 (_1!4229 lt!142815)) (currentByte!4891 (_1!4229 lt!142815)) (size!2110 (buf!2461 (_1!4229 lt!142815))))))

(assert (=> d!30966 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!142815))) (currentByte!4891 (_1!4229 lt!142815)) (currentBit!4886 (_1!4229 lt!142815))) lt!143497)))

(declare-fun b!98779 () Bool)

(declare-fun res!81022 () Bool)

(assert (=> b!98779 (=> (not res!81022) (not e!64588))))

(assert (=> b!98779 (= res!81022 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143497))))

(declare-fun b!98780 () Bool)

(declare-fun lt!143494 () (_ BitVec 64))

(assert (=> b!98780 (= e!64588 (bvsle lt!143497 (bvmul lt!143494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98780 (or (= lt!143494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143494)))))

(assert (=> b!98780 (= lt!143494 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142815)))))))

(assert (= (and d!30966 res!81023) b!98779))

(assert (= (and b!98779 res!81022) b!98780))

(declare-fun m!143705 () Bool)

(assert (=> d!30966 m!143705))

(declare-fun m!143707 () Bool)

(assert (=> d!30966 m!143707))

(assert (=> b!98507 d!30966))

(declare-fun d!30968 () Bool)

(assert (=> d!30968 (= (invariant!0 (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288) (size!2110 (buf!2461 (_2!4220 lt!142834)))) (and (bvsge (currentBit!4886 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4886 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4891 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4891 thiss!1288) (size!2110 (buf!2461 (_2!4220 lt!142834)))) (and (= (currentBit!4886 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4891 thiss!1288) (size!2110 (buf!2461 (_2!4220 lt!142834))))))))))

(assert (=> b!98507 d!30968))

(declare-fun d!30970 () Bool)

(assert (=> d!30970 (= (invariant!0 (currentBit!4886 lt!142839) (currentByte!4891 lt!142839) (size!2110 (buf!2461 (_2!4220 lt!142819)))) (and (bvsge (currentBit!4886 lt!142839) #b00000000000000000000000000000000) (bvslt (currentBit!4886 lt!142839) #b00000000000000000000000000001000) (bvsge (currentByte!4891 lt!142839) #b00000000000000000000000000000000) (or (bvslt (currentByte!4891 lt!142839) (size!2110 (buf!2461 (_2!4220 lt!142819)))) (and (= (currentBit!4886 lt!142839) #b00000000000000000000000000000000) (= (currentByte!4891 lt!142839) (size!2110 (buf!2461 (_2!4220 lt!142819))))))))))

(assert (=> b!98507 d!30970))

(declare-fun d!30972 () Bool)

(assert (=> d!30972 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142819)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142818)))

(declare-fun lt!143498 () Unit!6029)

(assert (=> d!30972 (= lt!143498 (choose!9 thiss!1288 (buf!2461 (_2!4220 lt!142819)) lt!142818 (BitStream!3695 (buf!2461 (_2!4220 lt!142819)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))))))

(assert (=> d!30972 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2461 (_2!4220 lt!142819)) lt!142818) lt!143498)))

(declare-fun bs!7582 () Bool)

(assert (= bs!7582 d!30972))

(assert (=> bs!7582 m!143087))

(declare-fun m!143709 () Bool)

(assert (=> bs!7582 m!143709))

(assert (=> b!98507 d!30972))

(declare-fun d!30974 () Bool)

(declare-fun e!64589 () Bool)

(assert (=> d!30974 e!64589))

(declare-fun res!81024 () Bool)

(assert (=> d!30974 (=> (not res!81024) (not e!64589))))

(declare-fun lt!143500 () (_ BitVec 64))

(declare-fun lt!143499 () BitStream!3694)

(assert (=> d!30974 (= res!81024 (= (bvadd lt!143500 (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))) (bitIndex!0 (size!2110 (buf!2461 lt!143499)) (currentByte!4891 lt!143499) (currentBit!4886 lt!143499))))))

(assert (=> d!30974 (or (not (= (bvand lt!143500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143500 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143500 (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30974 (= lt!143500 (bitIndex!0 (size!2110 (buf!2461 (_2!4222 lt!142833))) (currentByte!4891 (_2!4222 lt!142833)) (currentBit!4886 (_2!4222 lt!142833))))))

(assert (=> d!30974 (= lt!143499 (_2!4220 (moveBitIndex!0 (_2!4222 lt!142833) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819)))))))))

(assert (=> d!30974 (moveBitIndexPrecond!0 (_2!4222 lt!142833) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819)))))))

(assert (=> d!30974 (= (withMovedBitIndex!0 (_2!4222 lt!142833) (bvsub (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142834))) (currentByte!4891 (_2!4220 lt!142834)) (currentBit!4886 (_2!4220 lt!142834))) (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142819))) (currentByte!4891 (_2!4220 lt!142819)) (currentBit!4886 (_2!4220 lt!142819))))) lt!143499)))

(declare-fun b!98781 () Bool)

(assert (=> b!98781 (= e!64589 (= (size!2110 (buf!2461 (_2!4222 lt!142833))) (size!2110 (buf!2461 lt!143499))))))

(assert (= (and d!30974 res!81024) b!98781))

(declare-fun m!143711 () Bool)

(assert (=> d!30974 m!143711))

(declare-fun m!143713 () Bool)

(assert (=> d!30974 m!143713))

(declare-fun m!143715 () Bool)

(assert (=> d!30974 m!143715))

(declare-fun m!143717 () Bool)

(assert (=> d!30974 m!143717))

(assert (=> b!98507 d!30974))

(declare-fun d!30976 () Bool)

(assert (=> d!30976 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142819))))

(declare-fun lt!143501 () Unit!6029)

(assert (=> d!30976 (= lt!143501 (choose!30 thiss!1288 (_2!4220 lt!142834) (_2!4220 lt!142819)))))

(assert (=> d!30976 (isPrefixOf!0 thiss!1288 (_2!4220 lt!142834))))

(assert (=> d!30976 (= (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4220 lt!142834) (_2!4220 lt!142819)) lt!143501)))

(declare-fun bs!7583 () Bool)

(assert (= bs!7583 d!30976))

(assert (=> bs!7583 m!143681))

(declare-fun m!143719 () Bool)

(assert (=> bs!7583 m!143719))

(declare-fun m!143721 () Bool)

(assert (=> bs!7583 m!143721))

(assert (=> b!98507 d!30976))

(assert (=> b!98507 d!30880))

(declare-fun d!30978 () Bool)

(declare-fun e!64590 () Bool)

(assert (=> d!30978 e!64590))

(declare-fun res!81026 () Bool)

(assert (=> d!30978 (=> (not res!81026) (not e!64590))))

(declare-fun lt!143507 () (_ BitVec 64))

(declare-fun lt!143503 () (_ BitVec 64))

(declare-fun lt!143502 () (_ BitVec 64))

(assert (=> d!30978 (= res!81026 (= lt!143507 (bvsub lt!143502 lt!143503)))))

(assert (=> d!30978 (or (= (bvand lt!143502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143502 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143502 lt!143503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30978 (= lt!143503 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142811)))) ((_ sign_extend 32) (currentByte!4891 (_1!4229 lt!142811))) ((_ sign_extend 32) (currentBit!4886 (_1!4229 lt!142811)))))))

(declare-fun lt!143505 () (_ BitVec 64))

(declare-fun lt!143506 () (_ BitVec 64))

(assert (=> d!30978 (= lt!143502 (bvmul lt!143505 lt!143506))))

(assert (=> d!30978 (or (= lt!143505 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143506 (bvsdiv (bvmul lt!143505 lt!143506) lt!143505)))))

(assert (=> d!30978 (= lt!143506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30978 (= lt!143505 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142811)))))))

(assert (=> d!30978 (= lt!143507 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_1!4229 lt!142811))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_1!4229 lt!142811)))))))

(assert (=> d!30978 (invariant!0 (currentBit!4886 (_1!4229 lt!142811)) (currentByte!4891 (_1!4229 lt!142811)) (size!2110 (buf!2461 (_1!4229 lt!142811))))))

(assert (=> d!30978 (= (bitIndex!0 (size!2110 (buf!2461 (_1!4229 lt!142811))) (currentByte!4891 (_1!4229 lt!142811)) (currentBit!4886 (_1!4229 lt!142811))) lt!143507)))

(declare-fun b!98782 () Bool)

(declare-fun res!81025 () Bool)

(assert (=> b!98782 (=> (not res!81025) (not e!64590))))

(assert (=> b!98782 (= res!81025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143507))))

(declare-fun b!98783 () Bool)

(declare-fun lt!143504 () (_ BitVec 64))

(assert (=> b!98783 (= e!64590 (bvsle lt!143507 (bvmul lt!143504 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98783 (or (= lt!143504 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143504 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143504)))))

(assert (=> b!98783 (= lt!143504 ((_ sign_extend 32) (size!2110 (buf!2461 (_1!4229 lt!142811)))))))

(assert (= (and d!30978 res!81026) b!98782))

(assert (= (and b!98782 res!81025) b!98783))

(declare-fun m!143723 () Bool)

(assert (=> d!30978 m!143723))

(declare-fun m!143725 () Bool)

(assert (=> d!30978 m!143725))

(assert (=> b!98507 d!30978))

(declare-fun d!30980 () Bool)

(declare-fun lt!143522 () tuple2!7938)

(declare-fun lt!143523 () tuple2!7938)

(assert (=> d!30980 (and (= (_2!4221 lt!143522) (_2!4221 lt!143523)) (= (_1!4221 lt!143522) (_1!4221 lt!143523)))))

(declare-fun lt!143524 () (_ BitVec 64))

(declare-fun lt!143520 () Bool)

(declare-fun lt!143521 () BitStream!3694)

(declare-fun lt!143525 () Unit!6029)

(declare-fun choose!45 (BitStream!3694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!7938 tuple2!7938 BitStream!3694 (_ BitVec 64) Bool BitStream!3694 (_ BitVec 64) tuple2!7938 tuple2!7938 BitStream!3694 (_ BitVec 64)) Unit!6029)

(assert (=> d!30980 (= lt!143525 (choose!45 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816 lt!143522 (tuple2!7939 (_1!4221 lt!143522) (_2!4221 lt!143522)) (_1!4221 lt!143522) (_2!4221 lt!143522) lt!143520 lt!143521 lt!143524 lt!143523 (tuple2!7939 (_1!4221 lt!143523) (_2!4221 lt!143523)) (_1!4221 lt!143523) (_2!4221 lt!143523)))))

(assert (=> d!30980 (= lt!143523 (readNLeastSignificantBitsLoopPure!0 lt!143521 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143524))))

(assert (=> d!30980 (= lt!143524 (bvor lt!142816 (ite lt!143520 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30980 (= lt!143521 (withMovedBitIndex!0 (_1!4222 lt!142824) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!30980 (= lt!143520 (_2!4229 (readBitPure!0 (_1!4222 lt!142824))))))

(assert (=> d!30980 (= lt!143522 (readNLeastSignificantBitsLoopPure!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816))))

(assert (=> d!30980 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4222 lt!142824) nBits!388 #b00000000000000000000000000000000 lt!142816) lt!143525)))

(declare-fun bs!7585 () Bool)

(assert (= bs!7585 d!30980))

(assert (=> bs!7585 m!143063))

(assert (=> bs!7585 m!143065))

(assert (=> bs!7585 m!143073))

(declare-fun m!143727 () Bool)

(assert (=> bs!7585 m!143727))

(declare-fun m!143729 () Bool)

(assert (=> bs!7585 m!143729))

(assert (=> b!98507 d!30980))

(declare-fun d!30982 () Bool)

(assert (=> d!30982 (isPrefixOf!0 lt!142831 lt!142831)))

(declare-fun lt!143526 () Unit!6029)

(assert (=> d!30982 (= lt!143526 (choose!11 lt!142831))))

(assert (=> d!30982 (= (lemmaIsPrefixRefl!0 lt!142831) lt!143526)))

(declare-fun bs!7586 () Bool)

(assert (= bs!7586 d!30982))

(declare-fun m!143731 () Bool)

(assert (=> bs!7586 m!143731))

(declare-fun m!143733 () Bool)

(assert (=> bs!7586 m!143733))

(assert (=> b!98508 d!30982))

(declare-fun d!30984 () Bool)

(declare-fun e!64593 () Bool)

(assert (=> d!30984 e!64593))

(declare-fun res!81029 () Bool)

(assert (=> d!30984 (=> (not res!81029) (not e!64593))))

(declare-fun lt!143538 () tuple2!7960)

(assert (=> d!30984 (= res!81029 (= (buf!2461 (_2!4232 lt!143538)) (buf!2461 (_1!4222 lt!142590))))))

(declare-fun lt!143536 () tuple2!7960)

(assert (=> d!30984 (= lt!143538 (tuple2!7961 (_1!4232 lt!143536) (_2!4232 lt!143536)))))

(assert (=> d!30984 (= lt!143536 (readNLeastSignificantBitsLoop!0 (_1!4222 lt!142590) nBits!388 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!30984 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30984 (= (readNLeastSignificantBits!0 (_1!4222 lt!142590) nBits!388) lt!143538)))

(declare-fun lt!143537 () (_ BitVec 64))

(declare-fun b!98786 () Bool)

(declare-fun lt!143535 () (_ BitVec 64))

(assert (=> b!98786 (= e!64593 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4232 lt!143538))) (currentByte!4891 (_2!4232 lt!143538)) (currentBit!4886 (_2!4232 lt!143538))) (bvadd lt!143537 lt!143535)))))

(assert (=> b!98786 (or (not (= (bvand lt!143537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143537 lt!143535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98786 (= lt!143535 ((_ sign_extend 32) nBits!388))))

(assert (=> b!98786 (= lt!143537 (bitIndex!0 (size!2110 (buf!2461 (_1!4222 lt!142590))) (currentByte!4891 (_1!4222 lt!142590)) (currentBit!4886 (_1!4222 lt!142590))))))

(assert (= (and d!30984 res!81029) b!98786))

(declare-fun m!143735 () Bool)

(assert (=> d!30984 m!143735))

(declare-fun m!143737 () Bool)

(assert (=> b!98786 m!143737))

(declare-fun m!143739 () Bool)

(assert (=> b!98786 m!143739))

(assert (=> d!30826 d!30984))

(declare-fun d!30986 () Bool)

(assert (=> d!30986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) lt!142849) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 thiss!1288))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288))) lt!142849))))

(declare-fun bs!7587 () Bool)

(assert (= bs!7587 d!30986))

(assert (=> bs!7587 m!143115))

(assert (=> b!98509 d!30986))

(declare-fun d!30988 () Bool)

(assert (=> d!30988 (= (invariant!0 (currentBit!4886 thiss!1288) (currentByte!4891 thiss!1288) (size!2110 (buf!2461 thiss!1288))) (and (bvsge (currentBit!4886 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4886 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4891 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4891 thiss!1288) (size!2110 (buf!2461 thiss!1288))) (and (= (currentBit!4886 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4891 thiss!1288) (size!2110 (buf!2461 thiss!1288)))))))))

(assert (=> d!30844 d!30988))

(declare-fun d!30990 () Bool)

(declare-fun e!64594 () Bool)

(assert (=> d!30990 e!64594))

(declare-fun res!81031 () Bool)

(assert (=> d!30990 (=> (not res!81031) (not e!64594))))

(declare-fun lt!143539 () (_ BitVec 64))

(declare-fun lt!143544 () (_ BitVec 64))

(declare-fun lt!143540 () (_ BitVec 64))

(assert (=> d!30990 (= res!81031 (= lt!143544 (bvsub lt!143539 lt!143540)))))

(assert (=> d!30990 (or (= (bvand lt!143539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143539 lt!143540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30990 (= lt!143540 (remainingBits!0 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))) ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142835))) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142835)))))))

(declare-fun lt!143542 () (_ BitVec 64))

(declare-fun lt!143543 () (_ BitVec 64))

(assert (=> d!30990 (= lt!143539 (bvmul lt!143542 lt!143543))))

(assert (=> d!30990 (or (= lt!143542 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143543 (bvsdiv (bvmul lt!143542 lt!143543) lt!143542)))))

(assert (=> d!30990 (= lt!143543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30990 (= lt!143542 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))))))

(assert (=> d!30990 (= lt!143544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4891 (_2!4220 lt!142835))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4886 (_2!4220 lt!142835)))))))

(assert (=> d!30990 (invariant!0 (currentBit!4886 (_2!4220 lt!142835)) (currentByte!4891 (_2!4220 lt!142835)) (size!2110 (buf!2461 (_2!4220 lt!142835))))))

(assert (=> d!30990 (= (bitIndex!0 (size!2110 (buf!2461 (_2!4220 lt!142835))) (currentByte!4891 (_2!4220 lt!142835)) (currentBit!4886 (_2!4220 lt!142835))) lt!143544)))

(declare-fun b!98787 () Bool)

(declare-fun res!81030 () Bool)

(assert (=> b!98787 (=> (not res!81030) (not e!64594))))

(assert (=> b!98787 (= res!81030 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143544))))

(declare-fun b!98788 () Bool)

(declare-fun lt!143541 () (_ BitVec 64))

(assert (=> b!98788 (= e!64594 (bvsle lt!143544 (bvmul lt!143541 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98788 (or (= lt!143541 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143541 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143541)))))

(assert (=> b!98788 (= lt!143541 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142835)))))))

(assert (= (and d!30990 res!81031) b!98787))

(assert (= (and b!98787 res!81030) b!98788))

(declare-fun m!143741 () Bool)

(assert (=> d!30990 m!143741))

(declare-fun m!143743 () Bool)

(assert (=> d!30990 m!143743))

(assert (=> b!98505 d!30990))

(assert (=> b!98505 d!30820))

(assert (=> b!98506 d!30922))

(assert (=> b!98506 d!30820))

(assert (=> d!30820 d!30868))

(assert (=> d!30820 d!30988))

(assert (=> d!30832 d!30830))

(declare-fun d!30992 () Bool)

(assert (=> d!30992 (validate_offset_bits!1 ((_ sign_extend 32) (size!2110 (buf!2461 (_2!4220 lt!142591)))) ((_ sign_extend 32) (currentByte!4891 thiss!1288)) ((_ sign_extend 32) (currentBit!4886 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(assert (=> d!30992 true))

(declare-fun _$6!219 () Unit!6029)

(assert (=> d!30992 (= (choose!9 thiss!1288 (buf!2461 (_2!4220 lt!142591)) ((_ sign_extend 32) nBits!388) (BitStream!3695 (buf!2461 (_2!4220 lt!142591)) (currentByte!4891 thiss!1288) (currentBit!4886 thiss!1288))) _$6!219)))

(declare-fun bs!7588 () Bool)

(assert (= bs!7588 d!30992))

(assert (=> bs!7588 m!142929))

(assert (=> d!30832 d!30992))

(push 1)

(assert (not b!98724))

(assert (not b!98682))

(assert (not d!30992))

(assert (not b!98721))

(assert (not d!30882))

(assert (not d!30952))

(assert (not b!98751))

(assert (not b!98693))

(assert (not b!98717))

(assert (not d!30904))

(assert (not d!30950))

(assert (not b!98723))

(assert (not bm!1231))

(assert (not d!30920))

(assert (not d!30930))

(assert (not b!98758))

(assert (not d!30946))

(assert (not d!30982))

(assert (not b!98773))

(assert (not b!98706))

(assert (not b!98720))

(assert (not b!98675))

(assert (not d!30980))

(assert (not bm!1232))

(assert (not d!30974))

(assert (not b!98753))

(assert (not bm!1233))

(assert (not d!30884))

(assert (not b!98765))

(assert (not d!30910))

(assert (not b!98679))

(assert (not b!98690))

(assert (not b!98755))

(assert (not d!30948))

(assert (not b!98677))

(assert (not d!30978))

(assert (not b!98759))

(assert (not d!30892))

(assert (not d!30936))

(assert (not d!30932))

(assert (not b!98762))

(assert (not b!98689))

(assert (not d!30894))

(assert (not d!30890))

(assert (not d!30958))

(assert (not b!98714))

(assert (not d!30934))

(assert (not d!30962))

(assert (not d!30972))

(assert (not b!98709))

(assert (not b!98688))

(assert (not d!30922))

(assert (not b!98692))

(assert (not b!98715))

(assert (not b!98745))

(assert (not d!30964))

(assert (not b!98731))

(assert (not d!30954))

(assert (not b!98757))

(assert (not d!30966))

(assert (not b!98754))

(assert (not b!98687))

(assert (not d!30976))

(assert (not b!98708))

(assert (not d!30984))

(assert (not b!98744))

(assert (not b!98685))

(assert (not b!98772))

(assert (not d!30942))

(assert (not d!30902))

(assert (not d!30990))

(assert (not b!98775))

(assert (not b!98750))

(assert (not b!98718))

(assert (not d!30944))

(assert (not b!98771))

(assert (not d!30900))

(assert (not d!30956))

(assert (not b!98711))

(assert (not b!98752))

(assert (not b!98763))

(assert (not b!98761))

(assert (not b!98705))

(assert (not d!30986))

(assert (not b!98697))

(assert (not d!30878))

(assert (not b!98786))

(assert (not b!98760))

(assert (not d!30960))

(assert (not d!30938))

(assert (not b!98712))

(assert (not b!98733))

(assert (not d!30886))

(assert (not b!98684))

(assert (not b!98695))

(assert (not b!98743))

(assert (not b!98746))

(assert (not b!98726))

(assert (not d!30876))

(assert (not d!30906))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27788 () Bool)

(assert start!27788)

(declare-fun b!143164 () Bool)

(declare-fun res!119553 () Bool)

(declare-fun e!95352 () Bool)

(assert (=> b!143164 (=> (not res!119553) (not e!95352))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!143164 (= res!119553 (bvslt from!447 to!404))))

(declare-fun b!143165 () Bool)

(declare-fun res!119544 () Bool)

(declare-fun e!95360 () Bool)

(assert (=> b!143165 (=> (not res!119544) (not e!95360))))

(declare-datatypes ((array!6545 0))(
  ( (array!6546 (arr!3685 (Array (_ BitVec 32) (_ BitVec 8))) (size!2962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5182 0))(
  ( (BitStream!5183 (buf!3391 array!6545) (currentByte!6275 (_ BitVec 32)) (currentBit!6270 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8924 0))(
  ( (Unit!8925) )
))
(declare-datatypes ((tuple2!12728 0))(
  ( (tuple2!12729 (_1!6705 Unit!8924) (_2!6705 BitStream!5182)) )
))
(declare-fun lt!222014 () tuple2!12728)

(declare-fun lt!222015 () tuple2!12728)

(declare-fun isPrefixOf!0 (BitStream!5182 BitStream!5182) Bool)

(assert (=> b!143165 (= res!119544 (isPrefixOf!0 (_2!6705 lt!222014) (_2!6705 lt!222015)))))

(declare-fun b!143166 () Bool)

(declare-fun arr!237 () array!6545)

(declare-datatypes ((tuple2!12730 0))(
  ( (tuple2!12731 (_1!6706 BitStream!5182) (_2!6706 (_ BitVec 8))) )
))
(declare-fun lt!222016 () tuple2!12730)

(declare-fun e!95358 () Bool)

(declare-datatypes ((tuple2!12732 0))(
  ( (tuple2!12733 (_1!6707 BitStream!5182) (_2!6707 BitStream!5182)) )
))
(declare-fun lt!222010 () tuple2!12732)

(assert (=> b!143166 (= e!95358 (and (= (_2!6706 lt!222016) (select (arr!3685 arr!237) from!447)) (= (_1!6706 lt!222016) (_2!6707 lt!222010))))))

(declare-fun readBytePure!0 (BitStream!5182) tuple2!12730)

(assert (=> b!143166 (= lt!222016 (readBytePure!0 (_1!6707 lt!222010)))))

(declare-fun thiss!1634 () BitStream!5182)

(declare-fun reader!0 (BitStream!5182 BitStream!5182) tuple2!12732)

(assert (=> b!143166 (= lt!222010 (reader!0 thiss!1634 (_2!6705 lt!222014)))))

(declare-fun b!143167 () Bool)

(declare-fun res!119548 () Bool)

(assert (=> b!143167 (=> (not res!119548) (not e!95358))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143167 (= res!119548 (= (bitIndex!0 (size!2962 (buf!3391 (_2!6705 lt!222014))) (currentByte!6275 (_2!6705 lt!222014)) (currentBit!6270 (_2!6705 lt!222014))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2962 (buf!3391 thiss!1634)) (currentByte!6275 thiss!1634) (currentBit!6270 thiss!1634)))))))

(declare-fun b!143168 () Bool)

(declare-fun e!95355 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143168 (= e!95355 (invariant!0 (currentBit!6270 thiss!1634) (currentByte!6275 thiss!1634) (size!2962 (buf!3391 (_2!6705 lt!222014)))))))

(declare-fun res!119551 () Bool)

(assert (=> start!27788 (=> (not res!119551) (not e!95352))))

(assert (=> start!27788 (= res!119551 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2962 arr!237))))))

(assert (=> start!27788 e!95352))

(assert (=> start!27788 true))

(declare-fun array_inv!2751 (array!6545) Bool)

(assert (=> start!27788 (array_inv!2751 arr!237)))

(declare-fun e!95354 () Bool)

(declare-fun inv!12 (BitStream!5182) Bool)

(assert (=> start!27788 (and (inv!12 thiss!1634) e!95354)))

(declare-fun b!143169 () Bool)

(declare-fun e!95361 () Bool)

(assert (=> b!143169 (= e!95360 (not e!95361))))

(declare-fun res!119550 () Bool)

(assert (=> b!143169 (=> res!119550 e!95361)))

(declare-datatypes ((tuple2!12734 0))(
  ( (tuple2!12735 (_1!6708 BitStream!5182) (_2!6708 array!6545)) )
))
(declare-fun lt!222009 () tuple2!12734)

(declare-fun lt!222008 () tuple2!12732)

(assert (=> b!143169 (= res!119550 (or (not (= (size!2962 (_2!6708 lt!222009)) (size!2962 arr!237))) (not (= (_1!6708 lt!222009) (_2!6707 lt!222008)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5182 array!6545 (_ BitVec 32) (_ BitVec 32)) tuple2!12734)

(assert (=> b!143169 (= lt!222009 (readByteArrayLoopPure!0 (_1!6707 lt!222008) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!222005 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143169 (validate_offset_bits!1 ((_ sign_extend 32) (size!2962 (buf!3391 (_2!6705 lt!222015)))) ((_ sign_extend 32) (currentByte!6275 (_2!6705 lt!222014))) ((_ sign_extend 32) (currentBit!6270 (_2!6705 lt!222014))) lt!222005)))

(declare-fun lt!222012 () Unit!8924)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5182 array!6545 (_ BitVec 64)) Unit!8924)

(assert (=> b!143169 (= lt!222012 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6705 lt!222014) (buf!3391 (_2!6705 lt!222015)) lt!222005))))

(assert (=> b!143169 (= lt!222008 (reader!0 (_2!6705 lt!222014) (_2!6705 lt!222015)))))

(declare-fun b!143170 () Bool)

(declare-fun e!95353 () Bool)

(declare-fun lt!222001 () tuple2!12730)

(declare-fun lt!222007 () tuple2!12730)

(assert (=> b!143170 (= e!95353 (= (_2!6706 lt!222001) (_2!6706 lt!222007)))))

(declare-fun b!143171 () Bool)

(assert (=> b!143171 (= e!95354 (array_inv!2751 (buf!3391 thiss!1634)))))

(declare-fun b!143172 () Bool)

(declare-fun res!119547 () Bool)

(assert (=> b!143172 (=> (not res!119547) (not e!95352))))

(assert (=> b!143172 (= res!119547 (invariant!0 (currentBit!6270 thiss!1634) (currentByte!6275 thiss!1634) (size!2962 (buf!3391 thiss!1634))))))

(declare-fun b!143173 () Bool)

(declare-fun res!119552 () Bool)

(assert (=> b!143173 (=> (not res!119552) (not e!95358))))

(assert (=> b!143173 (= res!119552 (isPrefixOf!0 thiss!1634 (_2!6705 lt!222014)))))

(declare-fun b!143174 () Bool)

(declare-fun e!95359 () Bool)

(assert (=> b!143174 (= e!95359 e!95360)))

(declare-fun res!119554 () Bool)

(assert (=> b!143174 (=> (not res!119554) (not e!95360))))

(assert (=> b!143174 (= res!119554 (= (bitIndex!0 (size!2962 (buf!3391 (_2!6705 lt!222015))) (currentByte!6275 (_2!6705 lt!222015)) (currentBit!6270 (_2!6705 lt!222015))) (bvadd (bitIndex!0 (size!2962 (buf!3391 (_2!6705 lt!222014))) (currentByte!6275 (_2!6705 lt!222014)) (currentBit!6270 (_2!6705 lt!222014))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222005))))))

(assert (=> b!143174 (= lt!222005 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143175 () Bool)

(declare-fun res!119555 () Bool)

(assert (=> b!143175 (=> (not res!119555) (not e!95352))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143175 (= res!119555 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2962 (buf!3391 thiss!1634))) ((_ sign_extend 32) (currentByte!6275 thiss!1634)) ((_ sign_extend 32) (currentBit!6270 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143176 () Bool)

(assert (=> b!143176 (= e!95352 (not (= (size!2962 (buf!3391 thiss!1634)) (size!2962 (buf!3391 (_2!6705 lt!222015))))))))

(declare-fun lt!222011 () tuple2!12732)

(assert (=> b!143176 (= (_2!6706 (readBytePure!0 (_1!6707 lt!222011))) (select (arr!3685 arr!237) from!447))))

(declare-fun lt!222003 () tuple2!12732)

(assert (=> b!143176 (= lt!222003 (reader!0 (_2!6705 lt!222014) (_2!6705 lt!222015)))))

(assert (=> b!143176 (= lt!222011 (reader!0 thiss!1634 (_2!6705 lt!222015)))))

(assert (=> b!143176 e!95353))

(declare-fun res!119545 () Bool)

(assert (=> b!143176 (=> (not res!119545) (not e!95353))))

(assert (=> b!143176 (= res!119545 (= (bitIndex!0 (size!2962 (buf!3391 (_1!6706 lt!222001))) (currentByte!6275 (_1!6706 lt!222001)) (currentBit!6270 (_1!6706 lt!222001))) (bitIndex!0 (size!2962 (buf!3391 (_1!6706 lt!222007))) (currentByte!6275 (_1!6706 lt!222007)) (currentBit!6270 (_1!6706 lt!222007)))))))

(declare-fun lt!222004 () Unit!8924)

(declare-fun lt!222013 () BitStream!5182)

(declare-fun readBytePrefixLemma!0 (BitStream!5182 BitStream!5182) Unit!8924)

(assert (=> b!143176 (= lt!222004 (readBytePrefixLemma!0 lt!222013 (_2!6705 lt!222015)))))

(assert (=> b!143176 (= lt!222007 (readBytePure!0 (BitStream!5183 (buf!3391 (_2!6705 lt!222015)) (currentByte!6275 thiss!1634) (currentBit!6270 thiss!1634))))))

(assert (=> b!143176 (= lt!222001 (readBytePure!0 lt!222013))))

(assert (=> b!143176 (= lt!222013 (BitStream!5183 (buf!3391 (_2!6705 lt!222014)) (currentByte!6275 thiss!1634) (currentBit!6270 thiss!1634)))))

(assert (=> b!143176 e!95355))

(declare-fun res!119543 () Bool)

(assert (=> b!143176 (=> (not res!119543) (not e!95355))))

(assert (=> b!143176 (= res!119543 (isPrefixOf!0 thiss!1634 (_2!6705 lt!222015)))))

(declare-fun lt!222006 () Unit!8924)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5182 BitStream!5182 BitStream!5182) Unit!8924)

(assert (=> b!143176 (= lt!222006 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6705 lt!222014) (_2!6705 lt!222015)))))

(assert (=> b!143176 e!95359))

(declare-fun res!119549 () Bool)

(assert (=> b!143176 (=> (not res!119549) (not e!95359))))

(assert (=> b!143176 (= res!119549 (= (size!2962 (buf!3391 (_2!6705 lt!222014))) (size!2962 (buf!3391 (_2!6705 lt!222015)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5182 array!6545 (_ BitVec 32) (_ BitVec 32)) tuple2!12728)

(assert (=> b!143176 (= lt!222015 (appendByteArrayLoop!0 (_2!6705 lt!222014) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143176 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2962 (buf!3391 (_2!6705 lt!222014)))) ((_ sign_extend 32) (currentByte!6275 (_2!6705 lt!222014))) ((_ sign_extend 32) (currentBit!6270 (_2!6705 lt!222014))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222002 () Unit!8924)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5182 BitStream!5182 (_ BitVec 64) (_ BitVec 32)) Unit!8924)

(assert (=> b!143176 (= lt!222002 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6705 lt!222014) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143176 e!95358))

(declare-fun res!119546 () Bool)

(assert (=> b!143176 (=> (not res!119546) (not e!95358))))

(assert (=> b!143176 (= res!119546 (= (size!2962 (buf!3391 thiss!1634)) (size!2962 (buf!3391 (_2!6705 lt!222014)))))))

(declare-fun appendByte!0 (BitStream!5182 (_ BitVec 8)) tuple2!12728)

(assert (=> b!143176 (= lt!222014 (appendByte!0 thiss!1634 (select (arr!3685 arr!237) from!447)))))

(declare-fun b!143177 () Bool)

(declare-fun arrayRangesEq!278 (array!6545 array!6545 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143177 (= e!95361 (not (arrayRangesEq!278 arr!237 (_2!6708 lt!222009) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!27788 res!119551) b!143175))

(assert (= (and b!143175 res!119555) b!143164))

(assert (= (and b!143164 res!119553) b!143172))

(assert (= (and b!143172 res!119547) b!143176))

(assert (= (and b!143176 res!119546) b!143167))

(assert (= (and b!143167 res!119548) b!143173))

(assert (= (and b!143173 res!119552) b!143166))

(assert (= (and b!143176 res!119549) b!143174))

(assert (= (and b!143174 res!119554) b!143165))

(assert (= (and b!143165 res!119544) b!143169))

(assert (= (and b!143169 (not res!119550)) b!143177))

(assert (= (and b!143176 res!119543) b!143168))

(assert (= (and b!143176 res!119545) b!143170))

(assert (= start!27788 b!143171))

(declare-fun m!219805 () Bool)

(assert (=> start!27788 m!219805))

(declare-fun m!219807 () Bool)

(assert (=> start!27788 m!219807))

(declare-fun m!219809 () Bool)

(assert (=> b!143168 m!219809))

(declare-fun m!219811 () Bool)

(assert (=> b!143172 m!219811))

(declare-fun m!219813 () Bool)

(assert (=> b!143166 m!219813))

(declare-fun m!219815 () Bool)

(assert (=> b!143166 m!219815))

(declare-fun m!219817 () Bool)

(assert (=> b!143166 m!219817))

(declare-fun m!219819 () Bool)

(assert (=> b!143167 m!219819))

(declare-fun m!219821 () Bool)

(assert (=> b!143167 m!219821))

(declare-fun m!219823 () Bool)

(assert (=> b!143165 m!219823))

(declare-fun m!219825 () Bool)

(assert (=> b!143176 m!219825))

(declare-fun m!219827 () Bool)

(assert (=> b!143176 m!219827))

(declare-fun m!219829 () Bool)

(assert (=> b!143176 m!219829))

(declare-fun m!219831 () Bool)

(assert (=> b!143176 m!219831))

(declare-fun m!219833 () Bool)

(assert (=> b!143176 m!219833))

(declare-fun m!219835 () Bool)

(assert (=> b!143176 m!219835))

(declare-fun m!219837 () Bool)

(assert (=> b!143176 m!219837))

(declare-fun m!219839 () Bool)

(assert (=> b!143176 m!219839))

(assert (=> b!143176 m!219813))

(declare-fun m!219841 () Bool)

(assert (=> b!143176 m!219841))

(declare-fun m!219843 () Bool)

(assert (=> b!143176 m!219843))

(declare-fun m!219845 () Bool)

(assert (=> b!143176 m!219845))

(declare-fun m!219847 () Bool)

(assert (=> b!143176 m!219847))

(assert (=> b!143176 m!219813))

(declare-fun m!219849 () Bool)

(assert (=> b!143176 m!219849))

(declare-fun m!219851 () Bool)

(assert (=> b!143176 m!219851))

(declare-fun m!219853 () Bool)

(assert (=> b!143174 m!219853))

(assert (=> b!143174 m!219819))

(declare-fun m!219855 () Bool)

(assert (=> b!143171 m!219855))

(declare-fun m!219857 () Bool)

(assert (=> b!143177 m!219857))

(declare-fun m!219859 () Bool)

(assert (=> b!143169 m!219859))

(declare-fun m!219861 () Bool)

(assert (=> b!143169 m!219861))

(declare-fun m!219863 () Bool)

(assert (=> b!143169 m!219863))

(assert (=> b!143169 m!219841))

(declare-fun m!219865 () Bool)

(assert (=> b!143173 m!219865))

(declare-fun m!219867 () Bool)

(assert (=> b!143175 m!219867))

(push 1)

(assert (not b!143175))

(assert (not b!143169))

(assert (not b!143176))

(assert (not start!27788))

(assert (not b!143165))

(assert (not b!143167))

(assert (not b!143171))

(assert (not b!143174))

(assert (not b!143177))

(assert (not b!143166))

(assert (not b!143172))

(assert (not b!143168))

(assert (not b!143173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

